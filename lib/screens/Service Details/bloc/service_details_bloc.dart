import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/lead_service/request_lead_service.dart';
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
        /* return emit(
          state.copyWith(
            status: ServicesFetchedStatus.success,
            //result: services.result,
            hasReachedMax: false,
          ),
        ); */
      }
      /* final lifts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            ); */
    } catch (_) {
      emit(state.copyWith(status: ServicesFetchedStatus.failure));
    }
  }
}
