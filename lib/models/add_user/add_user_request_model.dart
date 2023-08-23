class AddUserRequestModel {
  String? phone;
  String? fullName;
  String? username;
  String? email;
  String? password;
  String? parentId;

  AddUserRequestModel(
      {this.phone,
      this.fullName,
      this.username,
      this.email,
      this.password,
      this.parentId});

  AddUserRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    fullName = json['full_name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['full_name'] = fullName;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['parent_id'] = parentId;
    return data;
  }
}
