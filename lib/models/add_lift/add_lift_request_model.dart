class AddLiftRequestModel {
  String? siteName;
  String? siteAddress;
  String? customerName;
  String? email;
  String? phone;
  String? noOfLifts;
  String? floorDesignation;
  String? amcType;
  String? startDate;
  String? endDate;
  String? noOfServices;
  String? amount;
  String? userId;
  String? token;
  String? liftType;
  String? doorOpening;

  AddLiftRequestModel(
      {this.siteName,
      this.siteAddress,
      this.customerName,
      this.email,
      this.phone,
      this.noOfLifts,
      this.floorDesignation,
      this.amcType,
      this.startDate,
      this.endDate,
      this.noOfServices,
      this.amount,
      this.userId,
      this.token,
      this.liftType,
      this.doorOpening});

  AddLiftRequestModel.fromJson(Map<String, dynamic> json) {
    siteName = json['site_name'];
    siteAddress = json['site_address'];
    customerName = json['customer_name'];
    email = json['email'];
    phone = json['phone'];
    noOfLifts = json['no_of_lifts'];
    floorDesignation = json['floor_designation'];
    amcType = json['amc_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    noOfServices = json['no_of_services'];
    amount = json['amount'];
    userId = json['user_id'];
    token = json['token'];
    liftType = json['lift_type'];
    doorOpening = json['door_opening'];
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
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['no_of_services'] = noOfServices;
    data['amount'] = amount;
    data['user_id'] = userId;
    data['token'] = token;
    data['lift_type'] = liftType;
    data['door_opening'] = doorOpening;
    return data;
  }
}
