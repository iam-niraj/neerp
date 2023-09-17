import 'dart:convert';

AssignActivityErrorResponseModel assignActivityErrorResponseJson(String str) =>
    AssignActivityErrorResponseModel.fromJson(json.decode(str));

class AssignActivityErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  AssignActivityErrorResponseModel({this.success, this.result, this.errorMsg});

  AssignActivityErrorResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'].cast<String>();
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['result'] = this.result;
    data['error_msg'] = this.errorMsg;
    return data;
  }
}
