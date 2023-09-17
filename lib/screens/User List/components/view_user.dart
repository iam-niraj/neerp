import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/user_list/user_response_model.dart';
import 'package:neerp/utils/components/avatar.dart';
import 'package:neerp/utils/constants.dart';

class ViewUserPage extends StatelessWidget {
  const ViewUserPage({required this.user, super.key});

  final Result user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        const Align(
          alignment: Alignment.topCenter,
          child: Avatar(),
        ),
        SizedBox(
          height: 24.0.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Full Name:",
            style: kHeadline.copyWith(
                fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.fullName!,
            style: kBodyText.copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email:",
            style: kHeadline.copyWith(
                fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.email!,
            style: kBodyText.copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Mobile Number:",
            style: kHeadline.copyWith(
                fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.phone!,
            style: kBodyText.copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Username:",
            style: kHeadline.copyWith(
                fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.username!,
            style: kBodyText.copyWith(fontSize: 18.sp),
          ),
        ),
        const Spacer(
          flex: 5,
        ),
      ],
    );
  }
}
