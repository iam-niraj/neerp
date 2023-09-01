import 'dart:convert';

ViewActivityErrorResponseModel viewActivityErrorResponseJson(String str) =>
    ViewActivityErrorResponseModel.fromJson(json.decode(str));

class ViewActivityErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  ViewActivityErrorResponseModel({this.success, this.result, this.errorMsg});

  ViewActivityErrorResponseModel.fromJson(Map<String, dynamic> json) {
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
