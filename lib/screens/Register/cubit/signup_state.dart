part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String fullname;
  final String email;
  final String phone;
  final String username;
  final String password;
  final SignUpStatus status;
  final String errorMsg;

  const SignupState(
      {required this.fullname,
      required this.email,
      required this.phone,
      required this.username,
      required this.password,
      required this.status,
      required this.errorMsg});

  factory SignupState.initial() {
    return const SignupState(
        fullname: "",
        email: "",
        phone: "",
        username: "",
        password: "",
        errorMsg: "",
        status: SignUpStatus.initial);
  }

  SignupState copyWith({
    String? fullname,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? errorMsg,
    SignUpStatus? status,
  }) {
    return SignupState(
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object> get props =>
      [fullname, email, phone, username, password, status, errorMsg];
}
