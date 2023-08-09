// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';

class DateTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final IconData icon;
  final Function() onTap;

  const DateTextField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: TextFormField(
        readOnly: true,
        autofocus: false,
        controller: controller,
        onTap: onTap,
        style: mediumText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            height: 40.h,
            width: 40.w,
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset("assets/images/bg.png")),
                Positioned.fill(
                  child: Icon(
                    icon,
                    color: kPrimaryColor,
                    size: 32.0, /*Color(0xff224597)*/
                  ),
                ),
              ],
            ),
          ),
          labelStyle: mediumText.copyWith(color: Colors.black54),
          hintText: hint,
          labelText: title,
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
            return 'Please choose date properly !!!';
          }
          return null;
        },
      ),
    );
  }
}
