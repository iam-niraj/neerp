import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/pending_activity/pending_activity_response_model.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/constants.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key, required this.result});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Activity Details",
            style: kHeadline.copyWith(fontSize: 24.sp),
          ),
        ),
        SizedBox(
          height: 35.0.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Activity Name:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.activityName ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
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
                  result.customerName ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.phone ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
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
                  result.email ?? "",
                  style: kBodyText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 12.0.h,
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
                  result.siteName ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35.0.h,
        ),
        CustomFormButton(
          innerText: "Back",
          onPressed: () => Navigator.pop(context),
          fontSize: 24.sp,
        ),
      ],
    );
  }
}
