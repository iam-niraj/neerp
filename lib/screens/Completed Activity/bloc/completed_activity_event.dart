part of 'completed_activity_bloc.dart';

class CompletedActivityEvent extends Equatable {
  const CompletedActivityEvent();

  @override
  List<Object> get props => [];
}

class CompletedActivitiesFetched extends CompletedActivityEvent {
  final String id;
  final String token;

  const CompletedActivitiesFetched({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}
