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
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['fcm'] = fcm;
    return _data;
  }
}
