import 'dart:convert';

AddLiftResponseModel addLiftResponseJson(String str) =>
    AddLiftResponseModel.fromJson(json.decode(str));

class AddLiftResponseModel {
  int? success;
  Result? result;

  AddLiftResponseModel({this.success, this.result});

  AddLiftResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? leadId;

  Result({this.leadId});

  Result.fromJson(Map<String, dynamic> json) {
    leadId = json['lead_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lead_id'] = this.leadId;
    return data;
  }
}
