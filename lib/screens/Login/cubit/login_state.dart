part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String username;
  final String password;
  final LoginStatus status;

  const LoginState(
      {required this.username, required this.password, required this.status});

  factory LoginState.initial() {
    return const LoginState(
        username: "", password: "", status: LoginStatus.initial);
  }

  LoginState copyWith({
    String? username,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [username, password, status];
}
