import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogCutsomField extends StatelessWidget {
  final String labelText;
  final Widget? prefix;
  final Widget widget;

  const DialogCutsomField({
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
      child: UnconstrainedBox(
        child: Container(
          width: (size.width * 0.8).h,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: Column(
            children: [
              // if (prefix != null) ...[
              //   prefix!,
              //   const SizedBox(width: 10),
              // ],
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  labelText,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}
