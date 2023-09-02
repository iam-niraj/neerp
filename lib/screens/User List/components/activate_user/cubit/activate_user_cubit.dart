import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/activate_model/reequest_activate_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'activate_user_state.dart';

class ActivateUserCubit extends Cubit<ActivateUserState> {
  final APIService _apiService;
  ActivateUserCubit(this._apiService) : super(ActivateUserState.initial());

  void userIdChnaged(String value) {
    emit(
      state.copyWith(userId: value, status: ActivateUserStatus.initial),
    );
  }

  Future<void> activateUser() async {
    if (state.status == ActivateUserStatus.processing) return;
    emit(state.copyWith(status: ActivateUserStatus.processing));
    try {
      await _apiService.activateUser(
        RequestActivateUser(userId: state.userId),
      )
          ? emit(
              state.copyWith(status: ActivateUserStatus.success),
            )
          : emit(
              state.copyWith(status: ActivateUserStatus.failed),
            );
    } catch (_) {}
  }
}
