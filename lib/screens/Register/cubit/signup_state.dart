part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String username;
  final String password;
  final SignUpStatus status;

  const SignupState(
      {required this.username, required this.password, required this.status});

  factory SignupState.initial() {
    return const SignupState(
        username: "", password: "", status: SignUpStatus.initial);
  }

  SignupState copyWith({
    String? username,
    String? password,
    SignUpStatus? status,
  }) {
    return SignupState(
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [username, password, status];
}
