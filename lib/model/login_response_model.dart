class LoginResponseModel {
  Result? result;
  int? success;
  String? fcm;

  LoginResponseModel({this.result, this.success, this.fcm});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    success = json['success'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['success'] = success;
    data['fcm'] = fcm;
    return data;
  }
}

class Result {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? parentId;
  String? token;
  String? gcmId;
  String? isDeleted;
  String? login;
  String? otp;

  Result(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.parentId,
      this.token,
      this.gcmId,
      this.isDeleted,
      this.login,
      this.otp});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    parentId = json['parent_id'];
    token = json['token'];
    gcmId = json['gcm_id'];
    isDeleted = json['is_deleted'];
    login = json['login'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['username'] = username;
    data['password'] = password;
    data['parent_id'] = parentId;
    data['token'] = token;
    data['gcm_id'] = gcmId;
    data['is_deleted'] = isDeleted;
    data['login'] = login;
    data['otp'] = otp;
    return data;
  }
}
