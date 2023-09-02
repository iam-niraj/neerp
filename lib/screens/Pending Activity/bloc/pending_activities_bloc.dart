import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/pending_activity/request_pending_activity_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../models/pending_activity/pending_activity_response_model.dart';

part 'pending_activities_event.dart';
part 'pending_activities_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PendingActivitiesBloc
    extends Bloc<PendingActivitiesEvent, PendingActivitiesState> {
  final APIService _apiService;
  PendingActivitiesBloc({required APIService apiService})
      : _apiService = apiService,
        super(const PendingActivitiesState()) {
    on<PendingActivitiesFetched>(_onPendingActivitiesFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  _onPendingActivitiesFetched(PendingActivitiesFetched event,
      Emitter<PendingActivitiesState> emit) async {
    if (state.hasReachedMax) return;

    // if (state.status == PendingActivitiesFetchedStatus.initial) {
    print("heeeere");
    final response = await _apiService.getPendingActivitiesLift(
        PendingActivityRequestModel(userId: event.id, token: event.token));
    response.fold(
      (l) => emit(
        state.copyWith(
          status: PendingActivitiesFetchedStatus.success,
          result: l.result,
          hasReachedMax: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: PendingActivitiesFetchedStatus.failure,
          errorMsg: r.errorMsg,
          hasReachedMax: false,
        ),
      ),
    );
    //}
  }
}
