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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['parent_id'] = this.parentId;
    return data;
  }
}
