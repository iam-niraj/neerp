class EditLiftRequestModel {
  String? siteName;
  String? siteAddress;
  String? customerName;
  String? email;
  String? phone;
  String? noOfLifts;
  String? floorDesignation;
  String? amcType;
  String? custId;
  String? amount;
  String? userId;
  String? token;
  String? liftType;

  EditLiftRequestModel(
      {this.siteName,
      this.siteAddress,
      this.customerName,
      this.email,
      this.phone,
      this.noOfLifts,
      this.floorDesignation,
      this.amcType,
      this.custId,
      this.amount,
      this.userId,
      this.token,
      this.liftType});

  EditLiftRequestModel.fromJson(Map<String, dynamic> json) {
    siteName = json['site_name'];
    siteAddress = json['site_address'];
    customerName = json['customer_name'];
    email = json['email'];
    phone = json['phone'];
    noOfLifts = json['no_of_lifts'];
    floorDesignation = json['floor_designation'];
    amcType = json['amc_type'];
    custId = json['cust_id'];
    amount = json['amount'];
    userId = json['user_id'];
    token = json['token'];
    liftType = json['lift_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['site_name'] = siteName;
    data['site_address'] = siteAddress;
    data['customer_name'] = customerName;
    data['email'] = email;
    data['phone'] = phone;
    data['no_of_lifts'] = noOfLifts;
    data['floor_designation'] = floorDesignation;
    data['amc_type'] = amcType;
    data['cust_id'] = custId;
    data['amount'] = amount;
    data['user_id'] = userId;
    data['token'] = token;
    data['lift_type'] = liftType;
    return data;
  }
}
