// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/extensions.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final IconData icon;
  final textHt = Get.height - 91.0.hp;
  final textWt = Get.width - 10.0.wp;
  final Function() onTap;

  InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textWt,
      child: TextFormField(
        readOnly: true,
        autofocus: false,
        controller: controller,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 2.0.wp,
            ),
            height: textWt / 8,
            width: textWt / 8,
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset("assets/images/bg.png")),
                Positioned.fill(
                  child: Icon(
                    icon,
                    color: kPrimaryColor,
                    size: 32.0, /*Color(0xff224597)*/
                  ),
                ),
              ],
            ),
          ),
          labelStyle: TextStyle(color: Colors.black54, fontSize: 18.0),
          hintText: hint,
          labelText: title,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
