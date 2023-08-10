class LoginRequestModel {
  String? username;
  String? password;
  String? fcm;

  LoginRequestModel({this.username, this.password, this.fcm});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['fcm'] = fcm;
    return data;
  }
}
