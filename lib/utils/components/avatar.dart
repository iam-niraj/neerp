import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: const Color(0xFF1A3848),
      child: ClipOval(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/avatar.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
