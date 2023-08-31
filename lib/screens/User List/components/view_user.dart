import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/user_list/user_response_model.dart';
import 'package:neerp/utils/components/avatar.dart';

class ViewUserPage extends StatelessWidget {
  const ViewUserPage({required this.user, super.key});

  final Result user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Avatar(),
        ),
        SizedBox(
          height: 24.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Full Name:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.fullName!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.email!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Mobile Number:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.phone!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Username:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.username!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
