import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neerp/models/lift_list/lift_response_model.dart';
import 'package:neerp/utils/components/avatar.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewLiftPage extends StatelessWidget {
  const ViewLiftPage({required this.lift, super.key});

  final Result lift;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Avatar(),
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Customer Name:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.customerName!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Site Name:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.siteName!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Site Address:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.siteAddress!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.email!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Mobile Number:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.phone!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Number of Lifts:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.noOfLifts!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Lift Type:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.liftType!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Number of Floors:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.floorDesignation!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "AMC Type:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.amcType!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Number of Services:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.noOfServices!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start Date:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.startDate!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "End Date:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.endDate!,
              style: kBodyText,
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Amount:",
              style: kHeadline.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.amount!,
              style: kBodyText,
            ),
          ),
        ],
      ),
    );
  }
}
