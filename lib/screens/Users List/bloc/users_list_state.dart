part of 'users_list_bloc.dart';

enum UsersFetchedStatus { initial, success, failure }

class UsersListState extends Equatable {
  const UsersListState(
      {this.status = UsersFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false});

  final UsersFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;

  UsersListState copyWith({
    UsersFetchedStatus? status,
    List<Result>? result,
    bool? hasReachedMax,
  }) {
    return UsersListState(
      status: status ?? this.status,
      result: result ?? this.result,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''UsersListState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object> get props => [status, result, hasReachedMax];
}
