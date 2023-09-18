import 'dart:async';

import 'package:neerp/utils/config/services/shared_service.dart';
import 'package:neerp/models/customer/customer_model.dart';

class UserRepository {
  Customer? _customer;

  Future<Customer?> getUser() async {
    var loginDetails = await SharedService.loginDetails();
    if (_customer != null) return _customer;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _customer = Customer(
          id: loginDetails!.result!.id!,
          token: loginDetails.result!.token,
          fullName: loginDetails.result!.fullName,
          email: loginDetails.result!.email,
          phone: loginDetails.result!.phone,
          username: loginDetails.result!.username),
    );
  }
}
