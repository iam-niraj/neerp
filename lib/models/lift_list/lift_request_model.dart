import 'package:equatable/equatable.dart';

class LiftListRequestModel extends Equatable {
  String? token;
  String? userId;

  LiftListRequestModel({this.token, this.userId});

  LiftListRequestModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    data['user_id'] = userId;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [token, userId];
}
