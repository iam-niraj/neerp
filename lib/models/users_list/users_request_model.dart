import 'package:equatable/equatable.dart';



class UsersListRequestModel extends Equatable{
  String? token;
  String? userId;

  UsersListRequestModel({this.token, this.userId});

  UsersListRequestModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    return data;
  }

  @override
  List<Object?> get props => [token, userId];
}
