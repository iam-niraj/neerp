import 'dart:convert';

UserListResponseModel usersListResponseJson(String str) =>
    UserListResponseModel.fromJson(json.decode(str));

class UserListResponseModel {
  int? success;
  List<Result>? result;

  UserListResponseModel({this.success, this.result});

  UserListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
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
  int? isDeactivated;

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
      this.otp,
      this.isDeactivated});

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
    isDeactivated = json['is_deactivated'];
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
    data['is_deactivated'] = isDeactivated;
    return data;
  }
}
