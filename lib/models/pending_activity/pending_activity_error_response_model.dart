import 'dart:convert';

PendingActivityErrorResponseModel pendingActivityErrorResponseJson(
        String str) =>
    PendingActivityErrorResponseModel.fromJson(json.decode(str));

class PendingActivityErrorResponseModel {
  int? success;
  List<String>? result;
  String? errorMsg;

  PendingActivityErrorResponseModel({this.success, this.result, this.errorMsg});

  PendingActivityErrorResponseModel.fromJson(Map<String, dynamic> json) {
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
