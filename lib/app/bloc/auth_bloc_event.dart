part of 'auth_bloc_bloc.dart';

class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AuthBlocEvent {}

class AuthStatusChanged extends AuthBlocEvent {
  final AuthenticationStatus status;

  const AuthStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}
