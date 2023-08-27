part of 'service_details_bloc.dart';

enum ServicesFetchedStatus { initial, success, failure }

class ServiceDetailsState extends Equatable {
  const ServiceDetailsState(
      {this.status = ServicesFetchedStatus.initial,
      this.result = const [],
      this.hasReachedMax = false});

  final ServicesFetchedStatus status;
  final List<Result> result;
  final bool hasReachedMax;

  ServiceDetailsState copyWith({
    ServicesFetchedStatus? status,
    List<Result>? result,
    bool? hasReachedMax,
  }) {
    return ServiceDetailsState(
      status: status ?? this.status,
      result: result ?? this.result,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ServiceDetailsState { status: $status, hasReachedMax: $hasReachedMax, posts: ${result.length} }''';
  }

  @override
  List<Object> get props => [status, result, hasReachedMax];
}
