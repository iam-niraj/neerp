class SignUpRequestModel {
  String? phone;
  String? fullname;
  String? username;
  String? email;
  String? password;

  SignUpRequestModel(
      {this.phone, this.fullname, this.username, this.email, this.password});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
