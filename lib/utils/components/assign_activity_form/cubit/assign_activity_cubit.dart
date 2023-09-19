import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/assign_activity_model/assign_activity_request_model.dart';
import 'package:neerp/models/user_list/user_request_model.dart';
import 'package:neerp/models/user_list/user_response_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'assign_activity_state.dart';

class AssignActivityCubit extends Cubit<AssignActivityState> {
  final APIService _apiService;
  AssignActivityCubit(this._apiService) : super(AssignActivityState.initial());

  void startDateChanged(String value) {
    emit(state.copyWith(
        assignDate: value, status: AssignActivityStatus.initial));
  }

  void empChanged(String value) {
    emit(state.copyWith(emp: value, status: AssignActivityStatus.initial));
  }

  Future<void> getEmployees(value) async {
    try {
      if (state.status == AssignActivityStatus.initial) {
        final users = await _apiService
            .getUsersList(UserListRequestModel(userId: value, token: "123456"));

        return emit(
          state.copyWith(
            status: AssignActivityStatus.initial,
            result: users.result,
          ),
        );
      }
      /* final lifts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),`
            ); */
    } catch (_) {
      emit(state.copyWith(status: AssignActivityStatus.failure));
    }
  }

  Future<void> assignActivity(userId, actId) async {
    if (state.status == AssignActivityStatus.submitting) return;
    emit(state.copyWith(status: AssignActivityStatus.submitting));
    try {
      var result = await _apiService.assignActivity(
        AssignActivityRequestModel(
            assignDate: state.assignDate,
            token: "123456",
            userId: userId,
            activityId: actId,
            empId: state.emp),
      );

      result.fold(
        (l) => emit(state.copyWith(status: AssignActivityStatus.success)),
        (r) => emit(
          state.copyWith(
              status: AssignActivityStatus.failure, errorResponse: r.errorMsg),
        ),
      );
    } catch (_) {}
  }
}
