// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';

class DateTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final IconData icon;
  final Function() onTap;

  DateTextField(
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
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: "Intel",
        ),
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            height: 40,
            width: 40,
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
          labelStyle: TextStyle(color: Colors.black54, fontSize: 18.0),
          hintText: hint,
          labelText: title,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
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
