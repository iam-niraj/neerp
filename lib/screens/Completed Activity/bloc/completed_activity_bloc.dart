import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/completed_activity/request_completed_activities.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../models/completed_activity/completed_activities_list_response.dart';

part 'completed_activity_event.dart';
part 'completed_activity_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CompletedActivityBloc
    extends Bloc<CompletedActivityEvent, CompletedActivityState> {
  final APIService _apiService;
  CompletedActivityBloc({
    required APIService apiService,
  })  : _apiService = apiService,
        super((const CompletedActivityState())) {
    on<CompletedActivitiesFetched>(_onCompletedActivitiesFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  _onCompletedActivitiesFetched(CompletedActivitiesFetched event,
      Emitter<CompletedActivityState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == CompletedActivitiesFetchedStatus.initial) {
      final response = await _apiService.getCompletedActivitiesLift(
          RequestCompletedActivitiesList(userId: event.id, token: event.token));
      response.fold(
        (l) => emit(
          state.copyWith(
            status: CompletedActivitiesFetchedStatus.success,
            result: l.result,
            hasReachedMax: false,
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: CompletedActivitiesFetchedStatus.failure,
            errorMsg: r.errorMsg,
            hasReachedMax: false,
          ),
        ),
      );
    }
  }
}
