part of 'lift_list_bloc.dart';

class LiftListEvent extends Equatable {
  const LiftListEvent();

  @override
  List<Object> get props => [];
}

class LiftsFetched extends LiftListEvent {
  final String id;
  final String token;

  const LiftsFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}

class RefreshLiftsFetched extends LiftListEvent {
  final String id;
  final String token;

  const RefreshLiftsFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}
