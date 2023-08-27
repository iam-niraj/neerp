import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/components/data_card.dart';

import '../../../models/completed_activity/completed_activities_list_response.dart';

class CompletedActivityCard extends StatelessWidget {
  const CompletedActivityCard({super.key, required this.activity});

  final Result activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 15.w,
      ),
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xFF797F8A), width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          DataCard(
            title: 'Activity Date:',
            subTitle: "${activity.startDate!} to ${activity.endDate!}",
          ),
          DataCard(
            title: 'Customer Name:',
            subTitle: activity.customerName!,
          ),
          DataCard(
            title: 'Customer Email:',
            subTitle: activity.customerEmail!,
          ),
          DataCard(
            title: 'Customer Phone:',
            subTitle: activity.customerPhone!,
          ),
        ],
      ),
    );
  }
}
