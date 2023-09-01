part of 'users_list_bloc.dart';

class UsersListEvent extends Equatable {
  const UsersListEvent();

  @override
  List<Object> get props => [];
}

class UsersFetched extends UsersListEvent {
  final String id;
  final String token;

  const UsersFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}

