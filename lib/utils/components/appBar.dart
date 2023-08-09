// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 80.h,
              width: 250.w,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 40.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
