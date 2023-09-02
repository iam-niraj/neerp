import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/assigned_activity/assigned_activities_list_response.dart';
import 'package:neerp/models/assigned_activity/request_assigned_activities.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:stream_transform/stream_transform.dart';

part 'assigned_activity_event.dart';
part 'assigned_activity_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AssignedActivityBloc
    extends Bloc<AssignedActivityEvent, AssignedActivityState> {
  final APIService _apiService;
  AssignedActivityBloc({
    required APIService apiService,
  })  : _apiService = apiService,
        super((const AssignedActivityState())) {
    on<AssignedActivitiesFetched>(_onAssignedActivitiesFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  _onAssignedActivitiesFetched(AssignedActivitiesFetched event,
      Emitter<AssignedActivityState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == AssignedActivitiesFetchedStatus.initial) {
      final response = await _apiService.getAssignedActivitiesLift(
          RequestAssignedActivitiesList(userId: event.id, token: event.token));
      response.fold(
        (l) => emit(
          state.copyWith(
            status: AssignedActivitiesFetchedStatus.success,
            result: l.result,
            hasReachedMax: false,
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: AssignedActivitiesFetchedStatus.failure,
            errorMsg: r.errorMsg,
            hasReachedMax: false,
          ),
        ),
      );
    }
  }
}
