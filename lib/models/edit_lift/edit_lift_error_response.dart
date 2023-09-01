import 'dart:convert';

EditLiftErrorResponseModel editLiftErrorResponseJson(String str) =>
    EditLiftErrorResponseModel.fromJson(json.decode(str));

class EditLiftErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  EditLiftErrorResponseModel({this.success, this.result, this.errorMsg});

  EditLiftErrorResponseModel.fromJson(Map<String, dynamic> json) {
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
