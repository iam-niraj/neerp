import 'dart:convert';

LeadServiceErrorResponse getServicesByLeadErrorResponse(String str) =>
    LeadServiceErrorResponse.fromJson(json.decode(str));

class LeadServiceErrorResponse {
  int? success;
  List<String>? result;
  String? errorMsg;

  LeadServiceErrorResponse({this.success, this.result, this.errorMsg});

  LeadServiceErrorResponse.fromJson(Map<String, dynamic> json) {
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
