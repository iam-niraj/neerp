import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/completed_activity/completed_activities_list_response.dart';
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
                  "Activity Date:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${result.activityStartDate} to ${result.activityEndDate!}",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Start Comment:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.startComment ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "End Comment:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.endComment ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Served Checkedlist:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.servedChecklist ?? "",
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
                  "Customer Remark:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Good",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Employee:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.empName ?? "",
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Customer Remark:",
                  style: kHeadline.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.customerRemark ?? "",
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
