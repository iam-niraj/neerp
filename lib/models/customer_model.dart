import 'package:equatable/equatable.dart';
import 'package:neerp/models/login_response_model.dart';

class Customer extends Equatable {
  final String id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? parentId;
  final String? token;
  final String? gcmId;
  final String? isDeleted;
  final String? login;
  final String? otp;

  const Customer({
    required this.id,
    this.fullName,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.parentId,
    this.token,
    this.gcmId,
    this.isDeleted,
    this.login,
    this.otp,
  });

  static const empty = Customer(id: '');

  bool get isEmpty => this == Customer.empty;
  bool get isNotEmpty => this != Customer.empty;

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        phone,
        username,
        password,
        parentId,
        token,
        gcmId,
        isDeleted,
        login,
        otp
      ];
}
