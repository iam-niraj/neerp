class RequestViewActivityModel {
  String? activityId;
  String? token;

  RequestViewActivityModel({this.activityId, this.token});

  RequestViewActivityModel.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_id'] = activityId;
    data['token'] = token;
    return data;
  }
}
