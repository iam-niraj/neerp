import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  final double? fontSize;
  const CustomFormButton(
      {Key? key,
      required this.innerText,
      required this.onPressed,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xff233743),
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          innerText,
          style: TextStyle(color: Colors.white, fontSize: fontSize ?? 20.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
