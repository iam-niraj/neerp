import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/constants.dart';

import '../../../models/lead_service/response_lead_service.dart';

class ServiceDetailCard extends StatelessWidget {
  const ServiceDetailCard({super.key, required this.service});

  final Result service;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          service.activityName!,
          style: mediumText.copyWith(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 24.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "${service.activityStartDate!} to ${service.activityEndDate!}",
          style: mediumText.copyWith(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 24.sp),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomFormButton(
          innerText: "View Report",
          onPressed: () {},
          fontSize: 24.sp,
        )
      ],
    );
  }
}
