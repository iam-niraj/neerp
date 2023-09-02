class RequestAssignedActivitiesList {
  String? token;
  String? userId;

  RequestAssignedActivitiesList({this.token, this.userId});

  RequestAssignedActivitiesList.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    return data;
  }
}
