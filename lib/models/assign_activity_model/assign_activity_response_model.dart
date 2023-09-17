import 'dart:convert';

AssignActivityResponseModel assignActivityResponseJson(String str) =>
    AssignActivityResponseModel.fromJson(json.decode(str));

class AssignActivityResponseModel {
  int? success;
  Result? result;

  AssignActivityResponseModel({this.success, this.result});

  AssignActivityResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? msg;

  Result({this.msg});

  Result.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    return data;
  }
}
