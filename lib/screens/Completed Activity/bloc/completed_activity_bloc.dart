import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/completed_activity/request_completed_activities.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:neerp/models/completed_activity/completed_activities_list_response.dart';

part 'completed_activity_event.dart';
part 'completed_activity_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CompletedActivitiesBloc
    extends Bloc<CompletedActivitiesEvent, CompletedActivitiesState> {
  final APIService _apiService;
  CompletedActivitiesBloc({
    required APIService apiService,
  })  : _apiService = apiService,
        super((const CompletedActivitiesState())) {
    on<CompletedActivitiesFetched>(_onCompletedActivitiesFetched,
        transformer: throttleDroppable(throttleDuration));
        on<FilteredCompletedActivitiesFetched>(_onFilteredCompletedActivitiesFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  _onCompletedActivitiesFetched(CompletedActivitiesFetched event,
      Emitter<CompletedActivitiesState> emit) async {
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

   _onFilteredCompletedActivitiesFetched(FilteredCompletedActivitiesFetched event,
      Emitter<CompletedActivitiesState> emit) async {
    if (state.hasReachedMax) return;
    emit(
      state.copyWith(
        status: CompletedActivitiesFetchedStatus.initial,
      ),
    );
    if (state.status == CompletedActivitiesFetchedStatus.initial) {
      print("heeeere");
      emit(
        state.copyWith(
          status: CompletedActivitiesFetchedStatus.success,
          result: event.result,
          hasReachedMax: false,
        ),
      );
    }
  }
}
