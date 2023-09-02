import 'dart:convert';

PendingActivityResponseModel pendingActivityResponseJson(String str) =>
    PendingActivityResponseModel.fromJson(json.decode(str));

class PendingActivityResponseModel {
  int? success;
  List<Result>? result;

  PendingActivityResponseModel({this.success, this.result});

  PendingActivityResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? activityName;
  String? id;
  String? startDate;
  String? endDate;
  String? customerName;
  String? phone;
  String? email;
  String? fullName;
  String? siteName;

  Result(
      {this.activityName,
      this.id,
      this.startDate,
      this.endDate,
      this.customerName,
      this.phone,
      this.email,
      this.fullName,
      this.siteName});

  Result.fromJson(Map<String, dynamic> json) {
    activityName = json['activity_name'];
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    customerName = json['customer_name'];
    phone = json['phone'];
    email = json['email'];
    fullName = json['full_name'];
    siteName = json['site_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_name'] = activityName;
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['customer_name'] = customerName;
    data['phone'] = phone;
    data['email'] = email;
    data['full_name'] = fullName;
    data['site_name'] = siteName;
    return data;
  }
}
