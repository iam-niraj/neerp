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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_name'] = this.siteName;
    data['site_address'] = this.siteAddress;
    data['customer_name'] = this.customerName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['no_of_lifts'] = this.noOfLifts;
    data['floor_designation'] = this.floorDesignation;
    data['amc_type'] = this.amcType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['no_of_services'] = this.noOfServices;
    data['amount'] = this.amount;
    data['user_id'] = this.userId;
    data['token'] = this.token;
    data['lift_type'] = this.liftType;
    data['door_opening'] = this.doorOpening;
    return data;
  }
}
