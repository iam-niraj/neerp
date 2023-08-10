// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:neerp/utils/constants.dart';

class DashboardSet1 extends StatelessWidget {
  const DashboardSet1(
      {super.key,
      required this.iconHeight,
      required this.iconWidth,
      required this.icon,
      required this.title,
      this.icon2});

  final double iconHeight;
  final double iconWidth;
  final String icon;
  final String title;
  final String? icon2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconHeight,
      width: iconWidth,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              icon,
            ),
          ),
          icon2 != null
              ? Positioned(
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      icon2!,
                      height: iconHeight / 3,
                      width: iconHeight / 3,
                    ),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: bigText,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
