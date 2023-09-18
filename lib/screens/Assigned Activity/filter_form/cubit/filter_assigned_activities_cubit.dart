import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/assigned_activity/assigned_activities_list_response.dart';
import 'package:neerp/models/assigned_activity/request_assigned_activities.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'filter_assigned_activities_state.dart';

class FilterAssignedActivitiesCubit extends Cubit<FilterAssignedActivitiesState> {
  final APIService _apiService;
  FilterAssignedActivitiesCubit(this._apiService)
      : super(FilterAssignedActivitiesState.initial());

  void startDateChanged(String value) {
    emit(state.copyWith(
        startDate: value, status: FilterAssignedActivitiesStatus.initial));
  }

  void endDateChanged(String value) {
    emit(state.copyWith(
        endDate: value, status: FilterAssignedActivitiesStatus.initial));
  }

  /* void empChnaged(String value) {
    emit(state.copyWith(
        emp: value, status: FilterPendingActivitiesStatus.initial));
  } */

  Future<void> filterAndFetchAllAssignedActivities() async {
    if (state.status == FilterAssignedActivitiesStatus.submitting) return;
    emit(
      state.copyWith(
        status: FilterAssignedActivitiesStatus.submitting,
      ),
    );
    try {
      print("yaha pr hu");
      var result = await _apiService.getAssignedActivitiesLift(
        RequestAssignedActivitiesList(
          token: "123",
          userId: "232",
        ),
      );

      result.fold(
        (l) => emit(state.copyWith(
          result: l.result,
          status: FilterAssignedActivitiesStatus.success,
        )),
        (r) => emit(
          state.copyWith(
              status: FilterAssignedActivitiesStatus.error,
              errorResponse: r.errorMsg),
        ),
      );
    } catch (_) {}
  }
}

