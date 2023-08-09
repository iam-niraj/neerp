import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: kSecondaryColor,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Text(
            title,
            style: smallText.copyWith(color: white),
          ),
        ),
      ),
    );
  }
}
