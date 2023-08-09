import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/model/lift_model.dart';
import 'package:neerp/screens/Lift%20List/components/button.dart';
import 'package:neerp/utils/colors.dart';

import 'lift_data_card.dart';

class LiftCard extends StatelessWidget {
  const LiftCard({super.key, required this.lift});

  final LiftModel lift;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Container(
        height: 190.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2.w),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LiftDtata(
                title: 'Site Name:',
                subTitle: lift.siteName,
              ),
              LiftDtata(
                title: 'Customer Name:',
                subTitle: lift.customerName,
              ),
              LiftDtata(
                title: 'Email:',
                subTitle: lift.email,
              ),
              LiftDtata(
                title: 'Phone: ',
                subTitle: lift.phoneNo,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Button(
                    title: 'View Lift',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  const Button(
                    title: 'Edit Lift',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
