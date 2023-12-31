part of 'completed_activity_bloc.dart';

enum CompletedActivitiesFetchedStatus { initial, success, failure }

class CompletedActivitiesState extends Equatable {
  const CompletedActivitiesState(
      {this.status = CompletedActivitiesFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false,
      this.errorMsg = ""});

  final CompletedActivitiesFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;
  final String errorMsg;

  CompletedActivitiesState copyWith(
      {CompletedActivitiesFetchedStatus? status,
      List<Result>? result,
      bool? hasReachedMax,
      String? errorMsg}) {
    return CompletedActivitiesState(
        status: status ?? this.status,
        result: result ?? this.result,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  String toString() {
    return '''CompletedActivityState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object> get props => [status, hasReachedMax, result, errorMsg];
}
