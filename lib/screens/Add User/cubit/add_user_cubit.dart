import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/add_user/add_user_request_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  final APIService _apiService;
  AddUserCubit(this._apiService) : super(AddUserState.initial());

  void phoneChanged(String value) {
    emit(state.copyWith(phone: value, status: AddUserStatus.initial));
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(fullName: value, status: AddUserStatus.initial));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value, status: AddUserStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: AddUserStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: AddUserStatus.initial));
  }

  void parentIdChanged(String value) {
    emit(state.copyWith(parentId: value, status: AddUserStatus.initial));
  }

  Future<void> addUsertWithCredentials() async {
    if (state.status == AddUserStatus.submitting) return;
    emit(state.copyWith(status: AddUserStatus.submitting));
    try {
      var result = await _apiService.addUser(AddUserRequestModel(
          phone: state.phone,
          fullName: state.fullName,
          username: state.username,
          email: state.email,
          password: state.password,
          parentId: state.parentId));
      result.fold(
          (l) => emit(state.copyWith(status: AddUserStatus.success)),
          (r) => emit(state.copyWith(
              status: AddUserStatus.error, errorResponse: r.errorMsg)));
    } catch (_) {}
  }
}
