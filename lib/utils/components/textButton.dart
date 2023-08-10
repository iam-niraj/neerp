// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);
  final String buttonName;
  final Function() onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => Colors.white,
          ),
        ),
        onPressed: onTap,
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ).copyWith(color: textColor),
        ),
      ),
    );
    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
    //   child: Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Container(
    //       height: 58.h,
    //       width: double.infinity,
    //       decoration: const BoxDecoration(
    //         color: kPrimaryColor,
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(20),
    //         ),
    //       ),
    //       child: const Center(
    //         child: Text(
    //           "Continue",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(color: Colors.white, fontSize: 25),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
