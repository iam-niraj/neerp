part of 'assigned_activities_bloc.dart';

enum AssignedActivitiesFetchedStatus { initial, success, failure }

class AssignedActivitiesState extends Equatable {
  const AssignedActivitiesState(
      {this.status = AssignedActivitiesFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false,
      this.errorMsg = ""});

  final AssignedActivitiesFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;
  final String errorMsg;

  AssignedActivitiesState copyWith(
      {AssignedActivitiesFetchedStatus? status,
      List<Result>? result,
      bool? hasReachedMax,
      String? errorMsg}) {
    return AssignedActivitiesState(
        status: status ?? this.status,
        result: result ?? this.result,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  String toString() {
    return '''AssignedActivityState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object> get props => [status, hasReachedMax, result, errorMsg];
}
