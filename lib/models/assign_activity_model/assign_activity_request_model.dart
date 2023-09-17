class AssignActivityRequestModel {
  String? assignDate;
  String? empId;
  String? activityId;
  String? userId;
  String? token;

  AssignActivityRequestModel(
      {this.assignDate, this.empId, this.activityId, this.userId, this.token});

  AssignActivityRequestModel.fromJson(Map<String, dynamic> json) {
    assignDate = json['assign_date'];
    empId = json['emp_id'];
    activityId = json['activity_id'];
    userId = json['user_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assign_date'] = this.assignDate;
    data['emp_id'] = this.empId;
    data['activity_id'] = this.activityId;
    data['user_id'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}
