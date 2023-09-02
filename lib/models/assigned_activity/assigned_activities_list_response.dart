import 'dart:convert';

AssignedActivitiesResponseList assignedActivitiesResponseJson(String str) =>
    AssignedActivitiesResponseList.fromJson(json.decode(str));

class AssignedActivitiesResponseList {
  int? success;
  List<Result>? result;

  AssignedActivitiesResponseList({this.success, this.result});

  AssignedActivitiesResponseList.fromJson(Map<String, dynamic> json) {
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
  String? empName;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  String? id;
  String? userId;
  String? leadId;
  String? custId;
  String? empId;
  String? activityName;
  String? startDate;
  String? endDate;
  String? assignDate;
  String? activityStartDate;
  String? activityEndDate;
  String? servedChecklist;
  String? isDone;
  String? customerRemark;
  String? startComment;
  String? endComment;

  Result(
      {this.empName,
      this.customerName,
      this.customerEmail,
      this.customerPhone,
      this.id,
      this.userId,
      this.leadId,
      this.custId,
      this.empId,
      this.activityName,
      this.startDate,
      this.endDate,
      this.assignDate,
      this.activityStartDate,
      this.activityEndDate,
      this.servedChecklist,
      this.isDone,
      this.customerRemark,
      this.startComment,
      this.endComment});

  Result.fromJson(Map<String, dynamic> json) {
    empName = json['emp_name'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    id = json['id'];
    userId = json['user_id'];
    leadId = json['lead_id'];
    custId = json['cust_id'];
    empId = json['emp_id'];
    activityName = json['activity_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    assignDate = json['assign_date'];
    activityStartDate = json['activity_start_date'];
    activityEndDate = json['activity_end_date'];
    servedChecklist = json['served_checklist'];
    isDone = json['is_done'];
    customerRemark = json['customer_remark'];
    startComment = json['start_comment'];
    endComment = json['end_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emp_name'] = empName;
    data['customer_name'] = customerName;
    data['customer_email'] = customerEmail;
    data['customer_phone'] = customerPhone;
    data['id'] = id;
    data['user_id'] = userId;
    data['lead_id'] = leadId;
    data['cust_id'] = custId;
    data['emp_id'] = empId;
    data['activity_name'] = activityName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['assign_date'] = assignDate;
    data['activity_start_date'] = activityStartDate;
    data['activity_end_date'] = activityEndDate;
    data['served_checklist'] = servedChecklist;
    data['is_done'] = isDone;
    data['customer_remark'] = customerRemark;
    data['start_comment'] = startComment;
    data['end_comment'] = endComment;
    return data;
  }
}
