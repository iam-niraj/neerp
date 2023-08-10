import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/model/activity_model.dart';
import 'package:neerp/screens/Lift%20List/components/button.dart';
import 'package:neerp/utils/components/data_card.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.model,
  });

  final ActivityModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DataCard(subTitle: model.activityNo, title: "Activity Number: "),
        DataCard(subTitle: model.activityDate, title: "Activity Date: "),
        DataCard(subTitle: model.customerName, title: "Customer Name: "),
        DataCard(subTitle: model.customerEmail, title: "Customer Email: "),
        DataCard(subTitle: model.customerPhone, title: "Customer Phone: "),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Button(title: "ASSIGN ACTIVITY"),
            SizedBox(
              width: 20.w,
            ),
            const Button(title: "VIEW ACTIVITY"),
          ],
        )
      ],
    );
  }
}
