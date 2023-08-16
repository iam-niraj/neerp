import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/lift_list/lift_response_model.dart';
import 'package:neerp/screens/Lift%20List/components/button.dart';
import 'package:neerp/utils/colors.dart';

import '../../../utils/components/data_card.dart';

class LiftCard extends StatelessWidget {
  const LiftCard({super.key, required this.lift});

  final Result lift;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2.w),
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataCard(
                title: 'Site Name: ',
                subTitle: lift.siteName!,
              ),
              DataCard(
                title: 'Customer Name: ',
                subTitle: lift.customerName!,
              ),
              DataCard(
                title: 'Email: ',
                subTitle: lift.email!,
              ),
              DataCard(
                title: 'Phone: ',
                subTitle: lift.phone!,
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
