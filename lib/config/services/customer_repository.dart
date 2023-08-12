import 'dart:async';

import 'package:neerp/config/services/shared_service.dart';
import 'package:neerp/models/customer_model.dart';

class UserRepository {
  Customer? _customer;

  Future<Customer?> getUser() async {
    var loginDetails = await SharedService.loginDetails();
    if (_customer != null) return _customer;
    return Future.delayed(
        const Duration(milliseconds: 300),
        () => _customer = Customer(
              id: loginDetails!.result!.id!,
            ));
  }
}
