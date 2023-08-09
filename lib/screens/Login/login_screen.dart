// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, sort_child_properties_last, unused_field, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/components/drop_down_text_field.dart';
import 'package:neerp/utils/components/text_field.dart';
import 'package:neerp/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                title: "Login",
              ),
              SizedBox(
                height: 24.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                        labelText: "Username",
                        icon: Icons.person_pin_rounded,
                        obscureText: false,
                        keyboardType: TextInputType.text),
                    MyTextField(
                        labelText: "Password",
                        icon: Icons.lock,
                        obscureText: true,
                        keyboardType: TextInputType.text),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 58.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
