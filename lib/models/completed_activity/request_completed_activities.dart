class RequestCompletedActivitiesList {
  String? token;
  String? userId;

  RequestCompletedActivitiesList({this.token, this.userId});

  RequestCompletedActivitiesList.fromJson(Map<String, dynamic> json) {
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
