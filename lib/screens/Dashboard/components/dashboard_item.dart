import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/utils/constants.dart';

class Item extends StatelessWidget {
  Item(
      {required this.icon,
      required this.title,
      this.icon2,
      required this.isTextTopPadding,
      this.onTap});

  final String icon;
  final String? icon2;
  final String title;
  final bool isTextTopPadding;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                  isTextTopPadding
                      ? SizedBox(
                          height: 10.0.h,
                        )
                      : Container(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: smallText.copyWith(
                        fontFamily: "Poppins", fontSize: 16.sp),
                  )
                ],
              ),
            ),
            icon2 != null
                ? Positioned(
                    bottom: 70.h,
                    left: 10.w,
                    child: SvgPicture.asset(
                      icon2!,
                      height: 30.h,
                      width: 30.w,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
