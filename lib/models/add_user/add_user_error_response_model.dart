import 'dart:convert';

AddUserErrorResponseModel addUserErrorResponseJson(String str) =>
    AddUserErrorResponseModel.fromJson(json.decode(str));

class AddUserErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  AddUserErrorResponseModel({this.success, this.result, this.errorMsg});

  AddUserErrorResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'].cast<String>();
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['result'] = result;
    data['error_msg'] = errorMsg;
    return data;
  }
}
