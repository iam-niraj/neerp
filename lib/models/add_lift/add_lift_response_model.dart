import 'dart:convert';

AddLiftResponseModel addLiftResponseJson(String str) =>
    AddLiftResponseModel.fromJson(json.decode(str));

class AddLiftResponseModel {
  int? success;
  Result? result;

  AddLiftResponseModel({this.success, this.result});

  AddLiftResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? leadId;

  Result({this.leadId});

  Result.fromJson(Map<String, dynamic> json) {
    leadId = json['lead_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lead_id'] = leadId;
    return data;
  }
}
