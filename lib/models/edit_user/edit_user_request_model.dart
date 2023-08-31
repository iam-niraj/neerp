class EditUserRequestModel {
  String? phone;
  String? fullName;
  String? email;
  String? userId;

  EditUserRequestModel({this.phone, this.fullName, this.email, this.userId});

  EditUserRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    fullName = json['full_name'];
    email = json['email'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['full_name'] = fullName;
    data['email'] = email;
    data['user_id'] = userId;
    return data;
  }
}
