import 'dart:convert';

ViewActivityResponseModel viewActivityResponseJson(String str) =>
    ViewActivityResponseModel.fromJson(json.decode(str));

class ViewActivityResponseModel {
  int? success;
  List<ViewActivityResult>? result;

  ViewActivityResponseModel({this.success, this.result});

  ViewActivityResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <ViewActivityResult>[];
      json['result'].forEach((v) {
        result!.add(ViewActivityResult.fromJson(v));
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

class ViewActivityResult {
  String? activityName;
  String? activityStartDate;
  String? activityEndDate;
  String? startDate;
  String? endDate;
  String? endComment;
  String? startComment;
  String? servedChecklist;
  String? customerName;
  String? email;
  String? phone;
  String? siteName;
  String? siteAddress;
  String? liftType;
  String? doorOpening;
  String? floorDesignation;
  String? fullName;
  String? id;
  String? startImage;
  String? endImage;

  ViewActivityResult(
      {this.activityName,
      this.activityStartDate,
      this.activityEndDate,
      this.startDate,
      this.endDate,
      this.endComment,
      this.startComment,
      this.servedChecklist,
      this.customerName,
      this.email,
      this.phone,
      this.siteName,
      this.siteAddress,
      this.liftType,
      this.doorOpening,
      this.floorDesignation,
      this.fullName,
      this.id,
      this.startImage,
      this.endImage});

  ViewActivityResult.fromJson(Map<String, dynamic> json) {
    activityName = json['activity_name'];
    activityStartDate = json['activity_start_date'];
    activityEndDate = json['activity_end_date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    endComment = json['end_comment'];
    startComment = json['start_comment'];
    servedChecklist = json['served_checklist'];
    customerName = json['customer_name'];
    email = json['email'];
    phone = json['phone'];
    siteName = json['site_name'];
    siteAddress = json['site_address'];
    liftType = json['lift_type'];
    doorOpening = json['door_opening'];
    floorDesignation = json['floor_designation'];
    fullName = json['full_name'];
    id = json['id'];
    startImage = json['start_image'];
    endImage = json['end_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_name'] = activityName;
    data['activity_start_date'] = activityStartDate;
    data['activity_end_date'] = activityEndDate;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['end_comment'] = endComment;
    data['start_comment'] = startComment;
    data['served_checklist'] = servedChecklist;
    data['customer_name'] = customerName;
    data['email'] = email;
    data['phone'] = phone;
    data['site_name'] = siteName;
    data['site_address'] = siteAddress;
    data['lift_type'] = liftType;
    data['door_opening'] = doorOpening;
    data['floor_designation'] = floorDesignation;
    data['full_name'] = fullName;
    data['id'] = id;
    data['start_image'] = startImage;
    data['end_image'] = endImage;
    return data;
  }
}
