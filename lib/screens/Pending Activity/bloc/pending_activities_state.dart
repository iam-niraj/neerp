part of 'pending_activities_bloc.dart';

enum PendingActivitiesFetchedStatus { initial, success, failure }

class PendingActivitiesState extends Equatable {
  const PendingActivitiesState(
      {this.status = PendingActivitiesFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false,
      this.errorMsg = ""});

  final PendingActivitiesFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;
  final String errorMsg;

  PendingActivitiesState copyWith(
      {PendingActivitiesFetchedStatus? status,
      List<Result>? result,
      bool? hasReachedMax,
      String? errorMsg}) {
    return PendingActivitiesState(
        status: status ?? this.status,
        result: result ?? this.result,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  String toString() {
    return '''PendingActivityState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object> get props => [status, hasReachedMax, result, errorMsg];
}
