part of 'filter_pending_activities_cubit.dart';

enum FilterPendingActivitiesStatus { initial, submitting, success, error }

class FilterPendingActivitiesState extends Equatable {
  const FilterPendingActivitiesState(
      {required this.startDate,
      required this.endDate,
      required this.status,
      required this.errorResponse});

  final String startDate;
  final String endDate;
  final FilterPendingActivitiesStatus status;
  final String errorResponse;

  factory FilterPendingActivitiesState.initial() {
    return const FilterPendingActivitiesState(
      startDate: '',
      endDate: '',
      status: FilterPendingActivitiesStatus.initial,
      errorResponse: '',
    );
  }

  FilterPendingActivitiesState copyWith(
      {String? startDate,
      String? endDate,
      FilterPendingActivitiesStatus? status,
      String? errorResponse}) {
    return FilterPendingActivitiesState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      errorResponse: errorResponse ?? this.errorResponse,
    );
  }

  @override
  List<Object> get props => [startDate, endDate, status, errorResponse];
}
