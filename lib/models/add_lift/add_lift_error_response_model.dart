import 'dart:convert';

AddLiftErrorResponseModel addLiftErrorResponseJson(String str) =>
    AddLiftErrorResponseModel.fromJson(json.decode(str));

class AddLiftErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  AddLiftErrorResponseModel({this.success, this.result, this.errorMsg});

  AddLiftErrorResponseModel.fromJson(Map<String, dynamic> json) {
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
