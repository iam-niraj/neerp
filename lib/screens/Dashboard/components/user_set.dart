import 'package:flutter/material.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/extensions.dart';

class UserSet extends StatelessWidget {
  const UserSet(
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
          Positioned(
            left: 0.0.wp,
            bottom: -3.0.hp,
            height: 25.0.hp,
            width: 25.0.wp,
            child: Image.asset(
              icon,
            ),
          ),
          icon2 != null
              ? Positioned(
                  right: 2.0.hp,
                  bottom: 3.4.hp,
                  height: iconHeight / 2.8,
                  width: iconHeight / 2.8,
                  child: Image.asset(
                    icon2!,
                  ),
                )
              : Container(),
          Positioned.fill(
            top: 12.5.hp,
            left: -4.0.wp,
            child: Center(
              child: Text(
                title,
                style: bigText.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
