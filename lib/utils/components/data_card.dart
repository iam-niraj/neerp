import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/constants.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    super.key,
    required this.subTitle,
    required this.title,
  });

  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: mediumText.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          subTitle,
          style: mediumText,
        ),
      ],
    );
  }
}
