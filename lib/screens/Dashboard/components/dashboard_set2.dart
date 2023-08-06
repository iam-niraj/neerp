import 'package:flutter/material.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/extensions.dart';

class DashboardSet2 extends StatelessWidget {
  const DashboardSet2(
      {super.key,
      required this.iconHeight,
      required this.iconWidth,
      required this.icon,
      required this.title1,
      required this.title2});

  final double iconHeight;
  final double iconWidth;
  final String icon;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconHeight,
      width: iconWidth,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 4.5.hp),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/job_icon.png",
                height: iconHeight / 1.5,
                width: iconWidth / 1.5,
              ),
            ),
          ),
          Positioned(
            right: -0.0.hp,
            bottom: 6.0.hp,
            height: iconHeight / 3.5,
            width: iconHeight / 3.5,
            child: Image.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
          /* Positioned.fill(
            top: 12.5.hp,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: bigText,
              ),
            ),
          ) */
          Padding(
            padding: EdgeInsets.only(bottom: 1.0.hp),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title1,
                    textAlign: TextAlign.center,
                    style: bigText.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    title2,
                    textAlign: TextAlign.center,
                    style: bigText.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
