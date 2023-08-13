import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neerp/models/customer/customer_model.dart';
import 'package:neerp/models/login/login_request_model.dart';
import 'package:neerp/models/login/login_response_model.dart';
import 'package:neerp/models/signup/sign_up_request_model.dart';
import 'package:neerp/models/signup/sign_up_response_model.dart';

import 'shared_service.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIService {
  static var client = http.Client();
  final _controller = StreamController<AuthenticationStatus>();

  var currentCustomer = Customer.empty;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (await SharedService.isLoggedIn()) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  /*  Stream<Customer> get customer async* {
    var loginDetails = await SharedService.loginDetails();

    final cust = await SharedService.isLoggedIn()
        ? Customer(
            id: loginDetails!.result!.id!,
          ) //loginDetails!.result as Customer
        : Customer.empty;

    print("in getting user");

    yield cust;
  } */

  Future<bool> login(
    LoginRequestModel model,
  ) async {
    print("in login");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse("https://onlinenes.co.in/webservice.php?action=login");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    print("response");

    print(
      loginResponseJson(
        response.body,
      ),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.authenticated),
      );

      return true;
    } else {
      return false;
    }
  }

  Future<SignUpResponseModel> register(
    SignUpRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse("https://onlinenes.co.in/webservice.php?action=signup");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(registerResponseJson(
      response.body,
    ));
    return registerResponseJson(
      response.body,
    );
  }

  void dispose() => _controller.close();

/*   static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response != null /* response.statusCode == 200 */) {
      return response.body;
    } else {
      return "";
    }
  } */
}
