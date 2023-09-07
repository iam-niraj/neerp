import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/completed_activity/completed_activities_list_response.dart';
import 'package:neerp/models/completed_activity/request_completed_activities.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'filter_completed_activities_state.dart';

class FilterCompletedActivitiesCubit extends Cubit<FilterCompletedActivitiesState> {
  final APIService _apiService;
  FilterCompletedActivitiesCubit(this._apiService)
      : super(FilterCompletedActivitiesState.initial());

  void startDateChanged(String value) {
    emit(state.copyWith(
        startDate: value, status: FilterCompletedActivitiesStatus.initial));
  }

  void endDateChanged(String value) {
    emit(state.copyWith(
        endDate: value, status: FilterCompletedActivitiesStatus.initial));
  }

  /* void empChnaged(String value) {
    emit(state.copyWith(
        emp: value, status: FilterPendingActivitiesStatus.initial));
  } */

  Future<void> filterAndFetchAllCompletedActivities() async {
    if (state.status == FilterCompletedActivitiesStatus.submitting) return;
    emit(
      state.copyWith(
        status: FilterCompletedActivitiesStatus.submitting,
      ),
    );
    try {
      print("yaha pr hu");
      var result = await _apiService.getCompletedActivitiesLift(
        RequestCompletedActivitiesList(
          token: "123",
          userId: "232",
        ),
      );

      result.fold(
        (l) => emit(state.copyWith(
          result: l.result,
          status: FilterCompletedActivitiesStatus.success,
        )),
        (r) => emit(
          state.copyWith(
              status: FilterCompletedActivitiesStatus.error,
              errorResponse: r.errorMsg),
        ),
      );
    } catch (_) {}
  }
}
