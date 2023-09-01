import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/lead_service/request_lead_service.dart';
import 'package:neerp/models/view_activity/request_view_activity.dart';
import 'package:neerp/models/view_activity/view_activity_response_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../models/lead_service/response_lead_service.dart';

part 'service_details_event.dart';
part 'service_details_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ServiceDetailsBloc
    extends Bloc<ServiceDetailsEvent, ServiceDetailsState> {
  final APIService _apiService;
  ServiceDetailsBloc({
    required APIService apiService,
  })  : _apiService = apiService,
        super(const ServiceDetailsState()) {
    on<ServicesFetched>(_onServicesFetched,
        transformer: throttleDroppable(throttleDuration));
    on<ViewActivityEvent>(_viewActivity);
    on<LoadServices>(_loadServices);
  }

  Future<void> _onServicesFetched(
      ServicesFetched event, Emitter<ServiceDetailsState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ServicesFetchedStatus.initial) {
        final result = await _apiService.getServicesByLead(RequestLeadService(
            userId: event.id, token: event.token, leadId: event.leadId));
        result.fold(
          (l) => emit(state.copyWith(
              status: ServicesFetchedStatus.success, result: l.result)),
          (r) => emit(
            state.copyWith(
              status: ServicesFetchedStatus.failure,
            ),
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: ServicesFetchedStatus.failure));
    }
  }

  Future<void> _viewActivity(
      ViewActivityEvent event, Emitter<ServiceDetailsState> emit) async {
    final result = await _apiService.viewActivity(RequestViewActivityModel(
        activityId: event.activityId, token: event.token));
    result.fold(
      (l) => emit(state.copyWith(
          status: ServicesFetchedStatus.view, viewActivity: l.result?.first)),
      (r) => emit(
        state.copyWith(
          status: ServicesFetchedStatus.failure,
        ),
      ),
    );
  }

  void _loadServices(LoadServices event, Emitter<ServiceDetailsState> emit) {
    emit(
      state.copyWith(
        status: ServicesFetchedStatus.success,
      ),
    );
  }
}
