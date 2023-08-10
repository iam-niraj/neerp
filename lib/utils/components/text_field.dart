// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final keyboardType;
  final controller;

  const MyTextField(
      {required this.labelText,
      required this.icon,
      required this.obscureText,
      required this.keyboardType,
      this.controller})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: TextFormField(
        controller: controller,
        style: mediumText,
        obscureText: obscureText,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.0.w,
            ),
            height: 40.h,
            width: 40.w,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/bg.png",
                  ),
                ),
                Positioned.fill(
                  child: Icon(
                    icon,
                    color: kPrimaryColor,
                    size: 30.0, /*Color(0xff224597)*/
                  ),
                ),
              ],
            ),
          ),
          labelText: labelText,
          labelStyle: mediumText.copyWith(color: Colors.black54),
          hintText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'Please enter details properly !!!';
          }
        },
      ),
    );
  }
}
