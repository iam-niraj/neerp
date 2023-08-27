import 'dart:convert';

AddUserResponseModel addUserResponseJson(String str) =>
    AddUserResponseModel.fromJson(json.decode(str));

class AddUserResponseModel {
  int? success;
  Result? result;

  AddUserResponseModel({this.success, this.result});

  AddUserResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? userId;

  Result({this.userId});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}
