part of 'pending_activities_cubit.dart';

enum PendingActivitiyFilterFormStatus { initial, submitting, success }

enum PendingActivitiyFilterStatus { initial, loading, success, error }

class PendingActivitiesState extends Equatable {
  const PendingActivitiesState(
      {required this.startDate,
      required this.endDate,
      required this.emp,
      required this.userId,
      required this.formStatus,
      required this.status,
      required this.result,
      required this.errorResponse});

  final String startDate;
  final String endDate;
  final String emp;
  final String userId;
  final List<Result> result;
  final PendingActivitiyFilterFormStatus formStatus;
  final PendingActivitiyFilterStatus status;
  final String errorResponse;

  factory PendingActivitiesState.initial() {
    return const PendingActivitiesState(
      startDate: '',
      endDate: '',
      emp: '',
      userId: '',
      result: [],
      formStatus: PendingActivitiyFilterFormStatus.initial,
      status: PendingActivitiyFilterStatus.initial,
      errorResponse: '',
    );
  }

  PendingActivitiesState copyWith(
      {String? startDate,
      String? endDate,
      String? emp,
      String? userId,
      List<Result>? result,
      PendingActivitiyFilterFormStatus? formStatus,
      PendingActivitiyFilterStatus? status,
      String? errorResponse}) {
    return PendingActivitiesState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      emp: emp ?? this.emp,
      userId: userId ?? this.userId,
      result: result ?? this.result,
      formStatus: formStatus ?? this.formStatus,
      status: status ?? this.status,
      errorResponse: errorResponse ?? this.errorResponse,
    );
  }

  @override
  List<Object> get props =>
      [startDate, endDate, emp, userId, formStatus, status, errorResponse];
}
