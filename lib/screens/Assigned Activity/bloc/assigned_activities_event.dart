part of 'assigned_activities_bloc.dart';

class AssignedActivitiesEvent extends Equatable {
  const AssignedActivitiesEvent();

  @override
  List<Object> get props => [];
}

class AssignedActivitiesFetched extends AssignedActivitiesEvent {
  final String id;
  final String token;

  const AssignedActivitiesFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}

class FilteredAssignedActivitiesFetched extends AssignedActivitiesEvent {
  final List<Result> result;
  const FilteredAssignedActivitiesFetched({required this.result});

  @override
  List<Object> get props => [result];
}
