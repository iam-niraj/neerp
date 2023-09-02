import 'dart:convert';

AssignedActivitiesListErrorResponse assignedActivitiesErrorResponseJson(
        String str) =>
    AssignedActivitiesListErrorResponse.fromJson(json.decode(str));

class AssignedActivitiesListErrorResponse {
  int? success;
  List<String>? result;
  String? errorMsg;

  AssignedActivitiesListErrorResponse(
      {this.success, this.result, this.errorMsg});

  AssignedActivitiesListErrorResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'].cast<String>();
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['result'] = result;
    data['error_msg'] = errorMsg;
    return data;
  }
}
