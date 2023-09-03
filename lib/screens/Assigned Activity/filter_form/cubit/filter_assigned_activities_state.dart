part of 'filter_assigned_activities_cubit.dart';

enum FilterAssignedActivitiesStatus { initial, submitting, success, error }

class FilterAssignedActivitiesState extends Equatable {
  const FilterAssignedActivitiesState(
      {required this.startDate,
      required this.endDate,
      required this.status,
      required this.result,
      required this.errorResponse});

  final String startDate;
  final String endDate;
  final FilterAssignedActivitiesStatus status;
  final List<Result> result;
  final String errorResponse;

  factory FilterAssignedActivitiesState.initial() {
    return const FilterAssignedActivitiesState(
      startDate: '',
      endDate: '',
      result: [],
      status: FilterAssignedActivitiesStatus.initial,
      errorResponse: '',
    );
  }

  FilterAssignedActivitiesState copyWith(
      {String? startDate,
      String? endDate,
      FilterAssignedActivitiesStatus? status,
      List<Result>? result,
      String? errorResponse}) {
    return FilterAssignedActivitiesState(
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
