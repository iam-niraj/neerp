import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final Widget? prefix;
  final Widget widget;

  const CustomInputField({
    Key? key,
    required this.labelText,
    this.prefix,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: size.width * 0.9,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        child: Column(children: [
          // if (prefix != null) ...[
          //   prefix!,
          //   const SizedBox(width: 10),
          // ],
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.bold),
            ),
          ),
          widget,
        ]),
      ),
    );
  }
}
