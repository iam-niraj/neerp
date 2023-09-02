part of 'activate_user_cubit.dart';

enum ActivateUserStatus { initial, success, failed, processing }

class ActivateUserState extends Equatable {
  const ActivateUserState({
    required this.userId,
    required this.status,
  });

  final String userId;
  final ActivateUserStatus status;

  factory ActivateUserState.initial() {
    return const ActivateUserState(
      userId: '',
      status: ActivateUserStatus.initial,
    );
  }

  ActivateUserState copyWith({String? userId, ActivateUserStatus? status}) {
    return ActivateUserState(
        status: status ?? this.status, userId: userId ?? this.userId);
  }

  @override
  List<Object> get props => [userId, status];
}
