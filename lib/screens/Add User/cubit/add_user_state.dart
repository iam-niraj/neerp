part of 'add_user_cubit.dart';

enum AddUserStatus { initial, submitting, success, error }

class AddUserState extends Equatable {
  const AddUserState({
    required this.phone,
    required this.fullName,
    required this.username,
    required this.email,
    required this.password,
    required this.parentId,
    required this.status,
    required this.errorResponse,
  });

  final String phone;
  final String fullName;
  final String username;
  final String email;
  final String password;
  final String parentId;
  final String errorResponse;
  final AddUserStatus status;

factory AddUserState.initial() {
    return const AddUserState(
       phone: '',
        fullName: '',
        username: '',
        email: '',
        password: '',
        parentId: '',
      errorResponse: '',
      status: AddUserStatus.initial
    );
  }


  AddUserState copyWith(
      {String? phone,
      String? fullName,
      String? username,
      String? email,
      String? password,
      String? parentId,
      String? errorResponse,
      AddUserStatus? status}) {
    return AddUserState(
        phone: phone ?? this.phone,
        fullName: fullName ?? this.fullName,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        parentId: parentId ?? this.parentId,
        status: status ?? this.status,
        errorResponse: errorResponse ?? this.errorResponse);
  }

  @override
  List<Object> get props => [
        phone,
        fullName,
        username,
        email,
        password,
        parentId,
        errorResponse,
        status
      ];
}
