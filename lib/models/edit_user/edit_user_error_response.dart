import 'dart:convert';

EditUserErrorResponseModel editUserErrorResponseJson(String str) =>
    EditUserErrorResponseModel.fromJson(json.decode(str));

class EditUserErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  EditUserErrorResponseModel({this.success, this.result, this.errorMsg});

  EditUserErrorResponseModel.fromJson(Map<String, dynamic> json) {
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
