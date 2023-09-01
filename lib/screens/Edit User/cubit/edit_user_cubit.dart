import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/edit_user/edit_user_request_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'edit_user_state.dart';

class EditUserCubit extends Cubit<EditUserState> {
  final APIService _apiService;
  EditUserCubit(this._apiService) : super(EditUserState.initial());

  void phoneChanged(String value) {
    emit(state.copyWith(phone: value, status: EditUserStatus.initial));
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(fullName: value, status: EditUserStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: EditUserStatus.initial));
  }

  void userIdChanged(String value) {
    emit(state.copyWith(userId: value, status: EditUserStatus.initial));
  }

  Future<void> editUserWithCredentials() async {
    if (state.status == EditUserStatus.submitting) return;
    emit(state.copyWith(status: EditUserStatus.submitting));
    try {
      var result = await _apiService.editUser(EditUserRequestModel(
        phone: state.phone,
        fullName: state.fullName,
        email: state.email,
        userId: state.userId,
      ));

      result.fold(
          (l) => emit(state.copyWith(status: EditUserStatus.success)),
          (r) => emit(state.copyWith(
              status: EditUserStatus.error, errorResponse: r.errorMsg)));
    } catch (_) {}
  }
}
