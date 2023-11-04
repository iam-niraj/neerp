import 'package:flutter/cupertino.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/lead_service/response_lead_service.dart';

class ServiceDetailCard extends StatelessWidget {
  const ServiceDetailCard(
      {super.key, required this.service, required this.onTap});

  final Result service;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 64,
              height: 64,
              color: const Color(0xffC4C4C4),
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.activityName!,
                  style: bigText.copyWith(
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${service.activityStartDate!} to ${service.activityEndDate!}",
                  style: kBodyText2.copyWith(fontSize: 16.sp),
                  /* style: bigText.copyWith(
                    fontSize: 10.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ), */
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff262626),
                        borderRadius: BorderRadius.all(
                          Radius.circular(48),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 2.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 1.5.h),
                      child: Text(
                        "View Activity",
                        style: smallText.copyWith(
                          fontSize: 12.sp,
                          color: white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
