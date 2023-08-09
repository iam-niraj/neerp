// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names, body_might_complete_normally_nullable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/extensions.dart';

class DropDownTextField extends StatelessWidget {
  final textHt = Get.height - 90.0.hp;
  final textWt = Get.width - 10.0.wp;
  final String labelText;
  final IconData icon;
  final List<String> values;

  DropDownTextField(
      {required this.labelText, required this.icon, required this.values})
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: textHt,
      width: textWt,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          isExpanded: false,
          autofocus: false,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: kPrimaryColor,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Intel",
          ),
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
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black54, fontSize: 18.0),
            hintText: '',
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
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          validator: (val) {
            if (val == null) {
              return 'Please choose one option !!!';
            }
          },
          onChanged: (Object? value) {},
          items: values.map(
            (value) {
              return DropdownMenuItem<String>(
                child: Container(
                  child: Text(
                    value.toString(),
                  ),
                ),
                value: value.toString(),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
