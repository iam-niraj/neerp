import 'dart:convert';

CompletedActivitiesListErrorResponse completedActivitiesErrorResponseJson(
        String str) =>
    CompletedActivitiesListErrorResponse.fromJson(json.decode(str));

class CompletedActivitiesListErrorResponse {
  int? success;
  List<String>? result;
  String? errorMsg;

  CompletedActivitiesListErrorResponse(
      {this.success, this.result, this.errorMsg});

  CompletedActivitiesListErrorResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = json['result'].cast<String>();
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['result'] = result;
    data['error_msg'] = errorMsg;
    return data;
  }
}
