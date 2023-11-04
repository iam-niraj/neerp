// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
      title: Text('Welcome', style: mediumText.copyWith(fontSize: 16.dp)),
      subtitle:
          Text('Amelia Barlow', style: mediumText.copyWith(fontSize: 20.dp)),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xFF1A3848),
        child: ClipOval(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/images/avatar.png"),
          ),
        ),
      ),
    );

    /* Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 80.h,
              width: 250.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: /* bigText.copyWith(
                          color: Colors
                              .white) */
                        Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ); */
  }
}
