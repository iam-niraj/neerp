import 'package:flutter/material.dart';
import 'package:neerp/models/assigned_activity/assigned_activities_list_response.dart';
import 'package:neerp/utils/components/data_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AssignedActivityCard extends StatelessWidget {
  const AssignedActivityCard({super.key, required this.activity});

  final Result activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 2.w,
      ),
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xFF797F8A), width: 0.3.w),
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
