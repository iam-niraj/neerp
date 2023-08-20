// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:neerp/models/add_lift/add_lift_error_response_model.dart';
import 'package:neerp/models/add_lift/add_lift_request_model.dart';
import 'package:neerp/models/add_lift/add_lift_response_model.dart';
import 'package:neerp/models/add_user/add_user_error_response_model.dart';
import 'package:neerp/models/add_user/add_user_request_model.dart';
import 'package:neerp/models/add_user/add_user_response_model.dart';
import 'package:neerp/models/customer/customer_model.dart';
import 'package:neerp/models/lift_list/lift_request_model.dart';
import 'package:neerp/models/lift_list/lift_response_model.dart';
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
    var r = registerResponseJson(
      response.body,
    );
    print(r.success);
    return registerResponseJson(
      response.body,
    );
  }

  Future<LiftListResponseModel> getLiftList(
    LiftListRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url =
        Uri.parse("https://onlinenes.co.in/webservice.php?action=lead_list");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(liftListResponseJson(response.body));
    return liftListResponseJson(response.body);
  }

  Future<Either<AddLiftResponseModel, AddLiftErrorResponseModel>> addLift(
    AddLiftRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url =
        Uri.parse("https://onlinenes.co.in/webservice.php?action=add_new_lead");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    print(data['success']);

    print("here after response");
    if (data['success'] == 1) {
      print(addLiftResponseJson(response.body));
      print("here after 1");
      return Left(addLiftResponseJson(response.body));
    } else {
      print(addLiftErrorResponseJson(response.body));
      print("here after 2");
      return Right(addLiftErrorResponseJson(response.body));
    }
  }

  Future<Either<AddUserResponseModel, AddUserErrorResponseModel>> addUser(
    AddUserRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url =
        Uri.parse("https://onlinenes.co.in/webservice.php?action=add_new_user");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(addUserResponseJson(response.body));
    final res = addUserResponseJson(response.body);
    if (res.success == 1) {
      print(addUserResponseJson(response.body));
      return Left(addUserResponseJson(response.body));
    } else {
      print(addUserErrorResponseJson(response.body));
      return Right(addUserErrorResponseJson(response.body));
    }
  }

  void dispose() => _controller.close();
}
