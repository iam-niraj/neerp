part of 'filter_completed_activities_cubit.dart';

enum FilterCompletedActivitiesStatus { initial, submitting, success, error }

class FilterCompletedActivitiesState extends Equatable {
  const FilterCompletedActivitiesState(
      {required this.startDate,
      required this.endDate,
      required this.status,
      required this.result,
      required this.errorResponse});

  final String startDate;
  final String endDate;
  final FilterCompletedActivitiesStatus status;
  final List<Result> result;
  final String errorResponse;

  factory FilterCompletedActivitiesState.initial() {
    return const FilterCompletedActivitiesState(
      startDate: '',
      endDate: '',
      result: [],
      status: FilterCompletedActivitiesStatus.initial,
      errorResponse: '',
    );
  }

  FilterCompletedActivitiesState copyWith(
      {String? startDate,
      String? endDate,
      FilterCompletedActivitiesStatus? status,
      List<Result>? result,
      String? errorResponse}) {
    return FilterCompletedActivitiesState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      result: result ?? this.result,
      errorResponse: errorResponse ?? this.errorResponse,
    );
  }

  @override
  List<Object> get props => [startDate, endDate, status, result, errorResponse];
}
