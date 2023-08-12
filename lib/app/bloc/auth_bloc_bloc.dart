import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/config/services/api_service.dart';
import 'package:neerp/config/services/customer_repository.dart';
import 'package:neerp/models/customer_model.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final APIService _apiService;
  final UserRepository _customerRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  //StreamSubscription<Customer>? _customerSubscription;
  AuthBlocBloc(
      {required APIService apiService,
      required UserRepository customerRepository})
      : _apiService = apiService,
        _customerRepository = customerRepository,
        super(const AuthBlocState.unknown()
            /* apiService.currentCustomer.isNotEmpty
            ? AuthBlocState.authenticated(apiService.currentCustomer)
            : const AuthBlocState.unauthenticated() */
            ) {
    on<AuthStatusChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _authenticationStatusSubscription =
        _apiService.status.listen((status) => add(AuthStatusChanged(status)));
/*     _customerSubscription = _apiService.customer
        .listen((customer) => add(AppUserChanged(customer))); */
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onUserChanged(
      AuthStatusChanged event, Emitter<AuthBlocState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthBlocState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final customer = await _tryGetUser();
        return emit(
          customer != null
              ? AuthBlocState.authenticated(customer)
              : const AuthBlocState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(const AuthBlocState.unknown());
    }

/*     emit(event.customer.isNotEmpty
        ? AuthBlocState.authenticated(event.customer)
        : AuthBlocState.unauthenticated()); */
  }

  void _onLogoutRequested(
      AppLogoutRequested event, Emitter<AuthBlocState> emit) {}

  Future<Customer?> _tryGetUser() async {
    try {
      final user = await _customerRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
