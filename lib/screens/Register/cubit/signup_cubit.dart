import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/models/signup/sign_up_request_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final APIService _apiService;
  SignupCubit(this._apiService) : super(SignupState.initial());

  void fullnameChanged(String value) {
    emit(state.copyWith(fullname: value, status: SignUpStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignUpStatus.initial));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(phone: value, status: SignUpStatus.initial));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value, status: SignUpStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignUpStatus.initial));
  }

  Future<void> signUpFormSubmitted() async {
    if (state.status == SignUpStatus.submitting) return;
    emit(state.copyWith(status: SignUpStatus.submitting));

    try {
      await _apiService.register(SignUpRequestModel(fullname: state.fullname, email: state.email, phone: state.phone, username: state.username, password: state.password));
      emit(state.copyWith(status: SignUpStatus.success));
    } catch (_) {}
  }
}
