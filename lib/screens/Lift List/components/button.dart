import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/extensions.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.title});

  final String title;
  final buttonHeight = Get.height - 80.0.hp;
  final buttonWidth = Get.width - 80.0.wp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight / 5,
      width: buttonHeight / 2,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: kSecondaryColor,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: mediumText.copyWith(color: white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
