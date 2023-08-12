import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/config/services/api_service.dart';
import 'package:neerp/models/login_request_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final APIService _apiService;

  LoginCubit(this._apiService) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(username: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> loginWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _apiService.login(LoginRequestModel(
        username: state.username,
        password: state.password,
        fcm: '123456',
      ));
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }
}
