part of 'assigned_activity_bloc.dart';

class AssignedActivityEvent extends Equatable {
  const AssignedActivityEvent();

  @override
  List<Object> get props => [];
}

class AssignedActivitiesFetched extends AssignedActivityEvent {
  final String id;
  final String token;

  const AssignedActivitiesFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}
