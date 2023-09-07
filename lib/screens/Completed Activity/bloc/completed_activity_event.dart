part of 'completed_activity_bloc.dart';

class CompletedActivitiesEvent extends Equatable {
  const CompletedActivitiesEvent();

  @override
  List<Object> get props => [];
}

class CompletedActivitiesFetched extends CompletedActivitiesEvent {
  final String id;
  final String token;

  const CompletedActivitiesFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}

class FilteredCompletedActivitiesFetched extends CompletedActivitiesEvent {
 
final List<Result> result;
  const FilteredCompletedActivitiesFetched({required this.result});

  @override
  List<Object> get props => [result];
}
