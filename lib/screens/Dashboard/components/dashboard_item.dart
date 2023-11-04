import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            /* Positioned(
              left: -50,
              top: 0,
              height: 10.h,
              child: Image.asset(
                "assets/images/glow.png",
              ),
            ), */
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: isTextTopPadding ? 0.5.h : 0,
                  ),
                  child: Opacity(
                    opacity: 0.9,
                    child: AspectRatio(
                      aspectRatio: 1.2,
                      child: SvgPicture.asset(
                        icon,
                      ),
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
                    bottom: 28.h,
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
