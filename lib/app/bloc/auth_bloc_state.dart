part of 'auth_bloc_bloc.dart';

class AuthBlocState extends Equatable {
  final AuthenticationStatus status;
  final Customer customer;

  const AuthBlocState._(
      {this.status = AuthenticationStatus.unknown,
      this.customer = Customer.empty});

  const AuthBlocState.unknown() : this._();

  const AuthBlocState.authenticated(Customer customer)
      : this._(status: AuthenticationStatus.authenticated, customer: customer);

  const AuthBlocState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );

  @override
  List<Object> get props => [status, customer];
}
