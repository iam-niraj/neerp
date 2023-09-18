import 'dart:convert';

SignUpErrorResponseModel registerErrorResponseJson(String str) =>
    SignUpErrorResponseModel.fromJson(json.decode(str));

class SignUpErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  SignUpErrorResponseModel({this.success, this.result, this.errorMsg});

  SignUpErrorResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'].cast<String>();
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['result'] = result;
    data['error_msg'] = errorMsg;
    return data;
  }
}
