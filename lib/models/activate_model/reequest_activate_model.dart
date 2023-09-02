import 'package:equatable/equatable.dart';

class RequestActivateUser extends Equatable {
  String? userId;

  RequestActivateUser({this.userId});

  RequestActivateUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }

  @override
  List<Object?> get props => [userId];
}
