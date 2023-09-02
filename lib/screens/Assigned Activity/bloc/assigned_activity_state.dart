part of 'assigned_activity_bloc.dart';

enum AssignedActivitiesFetchedStatus { initial, success, failure }

class AssignedActivityState extends Equatable {
  const AssignedActivityState(
      {this.status = AssignedActivitiesFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false,
      this.errorMsg = ""});

  final AssignedActivitiesFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;
  final String errorMsg;

  AssignedActivityState copyWith(
      {AssignedActivitiesFetchedStatus? status,
      List<Result>? result,
      bool? hasReachedMax,
      String? errorMsg}) {
    return AssignedActivityState(
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
