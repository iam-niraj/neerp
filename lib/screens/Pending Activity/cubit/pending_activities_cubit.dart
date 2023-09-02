/* import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/pending_activity/request_pending_activity_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

import '../../../models/pending_activity/pending_activity_response_model.dart';

part 'pending_activities_state.dart';

class PendingActivitiesCubit extends Cubit<PendingActivitiesState> {
  final APIService _apiService;
  PendingActivitiesCubit(this._apiService)
      : super(PendingActivitiesState.initial());

  void startDateChanged(String value) {
    emit(state.copyWith(
        startDate: value,
        formStatus: PendingActivitiyFilterFormStatus.initial));
  }

  void endDateChanged(String value) {
    emit(state.copyWith(
        endDate: value, formStatus: PendingActivitiyFilterFormStatus.initial));
  }

  void empChnaged(String value) {
    emit(state.copyWith(
        emp: value, formStatus: PendingActivitiyFilterFormStatus.initial));
  }

  Future<void> fetchAllPendingActivities() async {
    if (state.status == PendingActivitiyFilterStatus.loading) return;
    print("yaha pr hu");
    emit(state.copyWith(status: PendingActivitiyFilterStatus.loading));
    print("yaha pr hu");
    try {
      var result = await _apiService.getPendingActivitiesLift(
        PendingActivityRequestModel(
          token: "123",
          userId: "127",
        ),
      );

      result.fold(
          (l) => emit(state.copyWith(
              status: PendingActivitiyFilterStatus.success, result: l.result)),
          (r) => emit(state.copyWith(
              status: PendingActivitiyFilterStatus.error,
              errorResponse: r.errorMsg)));
    } catch (_) {}
  }

  Future<void> filterAndFetchAllPendingActivities() async {
    if (state.formStatus == PendingActivitiyFilterFormStatus.submitting) return;
    emit(
      state.copyWith(
          formStatus: PendingActivitiyFilterFormStatus.submitting,
          status: PendingActivitiyFilterStatus.loading),
    );
    try {
      var result = await _apiService.getPendingActivitiesLift(
        PendingActivityRequestModel(
          token: "123",
          userId: "232",
        ),
      );

      result.fold(
        (l) => emit(state.copyWith(
            result: l.result,
            status: PendingActivitiyFilterStatus.success,
            formStatus: PendingActivitiyFilterFormStatus.success)),
        (r) => emit(
          state.copyWith(
              status: PendingActivitiyFilterStatus.error,
              errorResponse: r.errorMsg),
        ),
      );
    } catch (_) {}
  }
}
 */