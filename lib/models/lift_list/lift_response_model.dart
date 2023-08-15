import 'dart:convert';

LiftListResponseModel liftListResponseJson(String str) =>
    LiftListResponseModel.fromJson(json.decode(str));

class LiftListResponseModel {
  int? success;
  List<Result>? result;

  LiftListResponseModel({this.success, this.result});

  LiftListResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? custId;
  String? leadId;
  String? userId;
  String? siteName;
  String? siteAddress;
  String? noOfLifts;
  String? liftType;
  String? doorOpening;
  String? floorDesignation;
  String? amcType;
  String? noOfServices;
  String? startDate;
  String? endDate;
  String? amount;
  String? isDeleted;
  String? customerName;
  String? email;
  String? phone;

  Result(
      {this.custId,
      this.leadId,
      this.userId,
      this.siteName,
      this.siteAddress,
      this.noOfLifts,
      this.liftType,
      this.doorOpening,
      this.floorDesignation,
      this.amcType,
      this.noOfServices,
      this.startDate,
      this.endDate,
      this.amount,
      this.isDeleted,
      this.customerName,
      this.email,
      this.phone});

  Result.fromJson(Map<String, dynamic> json) {
    custId = json['cust_id'];
    leadId = json['lead_id'];
    userId = json['user_id'];
    siteName = json['site_name'];
    siteAddress = json['site_address'];
    noOfLifts = json['no_of_lifts'];
    liftType = json['lift_type'];
    doorOpening = json['door_opening'];
    floorDesignation = json['floor_designation'];
    amcType = json['amc_type'];
    noOfServices = json['no_of_services'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    amount = json['amount'];
    isDeleted = json['is_deleted'];
    customerName = json['customer_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cust_id'] = custId;
    data['lead_id'] = leadId;
    data['user_id'] = userId;
    data['site_name'] = siteName;
    data['site_address'] = siteAddress;
    data['no_of_lifts'] = noOfLifts;
    data['lift_type'] = liftType;
    data['door_opening'] = doorOpening;
    data['floor_designation'] = floorDesignation;
    data['amc_type'] = amcType;
    data['no_of_services'] = noOfServices;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['amount'] = amount;
    data['is_deleted'] = isDeleted;
    data['customer_name'] = customerName;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
