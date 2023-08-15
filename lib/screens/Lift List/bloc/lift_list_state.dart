part of 'lift_list_bloc.dart';

enum LiftFetchedStatus { initial, success, failure }

class LiftListState extends Equatable {
  const LiftListState(
      {this.status = LiftFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false});

  final LiftFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;

  LiftListState copyWith({
    LiftFetchedStatus? status,
    List<Result>? result,
    bool? hasReachedMax,
  }) {
    return LiftListState(
      status: status ?? this.status,
      result: result ?? this.result,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''LiftListState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object> get props => [status, result, hasReachedMax];
}
