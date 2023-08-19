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
    return /* Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 23,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 25),
              blurRadius: 40,
              spreadRadius: -5,
              color: const Color(0xFF3d4785).withOpacity(.1),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataCard(
            title: 'Site Name:',
            subTitle: lift.siteName!,
          ),
          DataCard(
            title: 'Customer Name:',
            subTitle: lift.customerName!,
          ),
          DataCard(
            title: 'Email:',
            subTitle: lift.email!,
          ),
          DataCard(
            title: 'Phone:',
            subTitle: lift.phone!,
          ),
        ],
      ),
    ); */

        Container(
      margin: EdgeInsets.only(bottom: 18.h),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 15.w,
      ),
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFF797F8A), width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Column(
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
          /*  SizedBox(
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
              ), */
        ],
      ),
    );
  }
}
