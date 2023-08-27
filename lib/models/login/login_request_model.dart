class LoginRequestModel {
  LoginRequestModel({
    required this.username,
    required this.password,
    required this.fcm,
  });
  late final String username;
  late final String password;
  late final String fcm;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['fcm'] = fcm;
    return data;
  }
}
