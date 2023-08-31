part of 'edit_user_cubit.dart';

enum EditUserStatus { initial, submitting, success, error }

class EditUserState extends Equatable {
  const EditUserState(
      {required this.phone,
      required this.fullName,
      required this.email,
      required this.userId,
      required this.status,
      required this.errorResponse});

  final String phone;
  final String fullName;
  final String email;
  final String userId;
  final String errorResponse;
  final EditUserStatus status;

  factory EditUserState.initial() {
    return const EditUserState(
        phone: '',
        fullName: '',
        email: '',
        userId: '',
        errorResponse: '',
        status: EditUserStatus.initial);
  }

  EditUserState copyWith(
      {String? phone,
      String? fullName,
      String? email,
      String? userId,
      String? errorResponse,
      EditUserStatus? status}) {
    return EditUserState(
        phone: phone ?? this.phone,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        errorResponse: errorResponse ?? this.errorResponse);
  }

  @override
  List<Object> get props =>
      [phone, fullName, email, userId, errorResponse, status];
}
