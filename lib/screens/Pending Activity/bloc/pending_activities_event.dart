part of 'pending_activities_bloc.dart';

class PendingActivitiesEvent extends Equatable {
  const PendingActivitiesEvent();

  @override
  List<Object> get props => [];
}

class PendingActivitiesFetched extends PendingActivitiesEvent {
  final String id;
  final String token;

  const PendingActivitiesFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}

class FilteredPendingActivitiesFetched extends PendingActivitiesEvent {
 
final List<Result> result;
  const FilteredPendingActivitiesFetched({required this.result});

  @override
  List<Object> get props => [result];
}
