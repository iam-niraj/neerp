part of 'assign_activity_cubit.dart';

enum AssignActivityStatus { initial, submitting, success, failure }

class AssignActivityState extends Equatable {
  const AssignActivityState(
      {required this.result,
      required this.status,
      required this.assignDate,
      required this.emp,
      required this.errorResponse});

  final AssignActivityStatus status;
  final List<Result> result;
  final String assignDate;
  final String emp;
  final String errorResponse;

  factory AssignActivityState.initial() {
    return const AssignActivityState(
        result: [],
        status: AssignActivityStatus.initial,
        assignDate: '',
        emp: '',
        errorResponse: '');
  }

  AssignActivityState copyWith({
    AssignActivityStatus? status,
    List<Result>? result,
    String? assignDate,
    String? emp,
    String? errorResponse,
  }) {
    return AssignActivityState(
      result: result ?? this.result,
      status: status ?? this.status,
      assignDate: assignDate ?? this.assignDate,
      emp: emp ?? this.emp,
      errorResponse: errorResponse ?? this.errorResponse,
    );
  }

  @override
  List<Object> get props => [status, result, assignDate, emp, errorResponse];
}
