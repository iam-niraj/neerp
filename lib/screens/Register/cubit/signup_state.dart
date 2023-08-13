part of 'signup_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String fullname;
  final String email;
  final String phone;
  final String username;
  final String password;
  final SignUpStatus status;

  const SignupState({required this.fullname, required this.email, required this.phone, 
      required this.username, required this.password, required this.status});

  factory SignupState.initial() {
    return const SignupState(
        fullname: "", email: "", phone: "", username: "", password: "", status: SignUpStatus.initial);
  }

  SignupState copyWith({
    String? fullname,
    String? email,
    String? phone,
    String? username,
    String? password,
    SignUpStatus? status,
  }) {
    return SignupState(
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status, );
  }

  @override
  List<Object> get props => [fullname, email, phone, username, password, status];
}
