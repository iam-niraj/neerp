import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/pending_activity/pending_activity_response_model.dart';
import 'package:neerp/models/pending_activity/request_pending_activity_model.dart';
import 'package:neerp/screens/Pending%20Activity/bloc/pending_activities_bloc.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'filter_pending_activities_state.dart';

class FilterPendingActivitiesCubit extends Cubit<FilterPendingActivitiesState> {
  final APIService _apiService;
  FilterPendingActivitiesCubit(this._apiService)
      : super(FilterPendingActivitiesState.initial());

  void startDateChanged(String value) {
    emit(state.copyWith(
        startDate: value, status: FilterPendingActivitiesStatus.initial));
  }

  void endDateChanged(String value) {
    emit(state.copyWith(
        endDate: value, status: FilterPendingActivitiesStatus.initial));
  }

  /* void empChnaged(String value) {
    emit(state.copyWith(
        emp: value, status: FilterPendingActivitiesStatus.initial));
  } */

  Future<void> filterAndFetchAllPendingActivities() async {
    if (state.status == FilterPendingActivitiesStatus.submitting) return;
    emit(
      state.copyWith(
        status: FilterPendingActivitiesStatus.submitting,
      ),
    );
    try {
      print("yaha pr hu");
      var result = await _apiService.getPendingActivitiesLift(
        PendingActivityRequestModel(
          token: "123",
          userId: "232",
        ),
      );

      result.fold(
        (l) => emit(state.copyWith(
          result: l.result,
          status: FilterPendingActivitiesStatus.success,
        )),
        (r) => emit(
          state.copyWith(
              status: FilterPendingActivitiesStatus.error,
              errorResponse: r.errorMsg),
        ),
      );
    } catch (_) {}
  }
}
