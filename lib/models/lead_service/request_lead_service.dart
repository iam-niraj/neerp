class RequestLeadService {
  String? userId;
  String? token;
  String? leadId;

  RequestLeadService({this.userId, this.token, this.leadId});

  RequestLeadService.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    token = json['token'];
    leadId = json['lead_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['token'] = token;
    data['lead_id'] = leadId;
    return data;
  }
}
