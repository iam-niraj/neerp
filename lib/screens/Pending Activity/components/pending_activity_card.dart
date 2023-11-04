import 'package:flutter/material.dart';
import 'package:neerp/utils/components/data_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/pending_activity/pending_activity_response_model.dart';

class PendingActivityCard extends StatelessWidget {
  const PendingActivityCard({super.key, required this.activity});

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
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
            subTitle: activity.email!,
          ),
          DataCard(
            title: 'Customer Phone:',
            subTitle: activity.phone!,
          ),
        ],
      ),
    );
  }
}
