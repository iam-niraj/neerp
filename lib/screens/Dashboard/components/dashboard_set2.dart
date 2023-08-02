import 'package:flutter/material.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/extensions.dart';

class DashboardSet2 extends StatelessWidget {
  const DashboardSet2({
    super.key,
    required this.iconHeight,
    required this.iconWidth,
    required this.icon,
    required this.title,
  });

  final double iconHeight;
  final double iconWidth;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconHeight / 2,
      width: iconWidth / 2,
      child: Stack(
        children: [
          Positioned(
            left: -3.0.wp,
            height: 30.0.wp,
            width: 30.0.wp,
            child: Image.asset(
              "assets/images/job.png",
            ),
          ),
          Positioned(
            right: -1.0.hp,
            bottom: 4.5.hp,
            height: iconHeight / 6,
            child: Image.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            top: 12.5.hp,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: bigText.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
