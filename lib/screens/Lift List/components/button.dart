import 'package:flutter/material.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: black,
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
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Text(
            title,
            style: smallText.copyWith(color: white),
          ),
        ),
      ),
    );
  }
}
