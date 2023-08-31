import 'dart:convert';

EditLiftResponseModel editLiftResponseJson(String str) =>
    EditLiftResponseModel.fromJson(json.decode(str));

class EditLiftResponseModel {
  int? success;
  Result? result;

  EditLiftResponseModel({this.success, this.result});

  EditLiftResponseModel.fromJson(Map<String, dynamic> json) {
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
  bool? userId;

  Result({this.userId});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    return data;
  }
}
