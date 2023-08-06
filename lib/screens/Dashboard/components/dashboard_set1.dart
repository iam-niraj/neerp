// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/extensions.dart';

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
            alignment: Alignment.center,
            child: Image.asset(
              icon,
            ),
          ),
          icon2 != null
              ? Positioned(
                  left: 1.0.wp,
                  bottom: 3.2.hp,
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
          Padding(
            padding: EdgeInsets.only(bottom: 1.0.hp),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: bigText.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
