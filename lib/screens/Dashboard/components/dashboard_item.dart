import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/utils/constants.dart';

class Item extends StatelessWidget {
  Item(
      {super.key,
      required this.icon,
      required this.title,
      this.icon2,
      required this.isTextTopPadding,
      this.isLiftList = false,
      this.onTap});

  final String icon;
  final Widget? icon2;
  final String title;
  final bool isTextTopPadding;
  final bool isLiftList;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: isTextTopPadding ? 10.h : 0,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: smallText.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
              ],
            ),
            isLiftList
                ? Positioned(
                    bottom: 32.h,
                    left: 15.w,
                    child: icon2!,
                  )
                : icon2 != null
                    ? Positioned(
                        bottom: 45.h,
                        left: 10.w,
                        child: icon2!,
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
