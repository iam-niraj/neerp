import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/lift_list/lift_response_model.dart';
import 'package:neerp/utils/components/avatar.dart';

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
            height: 24.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Customer Name:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.customerName!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Site Name:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.siteName!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Site Address:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.siteAddress!,
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
              lift.email!,
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
              lift.phone!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Number of Lifts:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.noOfLifts!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Lift Type:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.liftType!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Number of Floors:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.floorDesignation!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "AMC Type:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.amcType!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Number of Services:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.noOfServices!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start Date:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.startDate!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "End Date:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.endDate!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Amount:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lift.amount!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
