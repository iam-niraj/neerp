part of 'service_details_bloc.dart';

enum ServicesFetchedStatus { initial, success, view, failure }

class ServiceDetailsState extends Equatable {
  const ServiceDetailsState(
      {this.status = ServicesFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false,
      this.viewActivity});

  final ServicesFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;
  final ViewActivityResult? viewActivity;

  ServiceDetailsState copyWith({
    ServicesFetchedStatus? status,
    List<Result>? result,
    bool? hasReachedMax,
    final ViewActivityResult? viewActivity,
  }) {
    return ServiceDetailsState(
      status: status ?? this.status,
      result: result ?? this.result,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      viewActivity: viewActivity ?? this.viewActivity,
    );
  }

  @override
  String toString() {
    return '''ServiceDetailsState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object?> get props => [
        status,
        result,
        hasReachedMax,
        viewActivity,
      ];
}
