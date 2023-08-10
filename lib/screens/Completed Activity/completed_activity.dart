import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/activity_list_dialog.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/components/date_text_field.dart';
import 'package:neerp/utils/components/drop_down_text_field.dart';

class CompletedActivityView extends StatefulWidget {
  const CompletedActivityView({super.key});

  @override
  State<CompletedActivityView> createState() => _CompletedActivityViewState();
}

class _CompletedActivityViewState extends State<CompletedActivityView> {
  DateTime _fromDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const MyAppBar(title: "Completed Activities"),
              SizedBox(
                height: 50.h,
              ),
              Column(
                children: [
                  DateTextField(
                    title: "From Date",
                    icon: Icons.calendar_month_outlined,
                    hint: DateFormat.yMd().format(_fromDate),
                    onTap: () => _getDateFromUser(),
                  ),
                  DateTextField(
                    title: "To Date",
                    icon: Icons.calendar_month_outlined,
                    hint: DateFormat.yMd().format(_fromDate),
                    onTap: () => _getDateFromUser(),
                  ),
                  const DropDownTextField(
                    labelText: "Employee",
                    icon: Icons.supervised_user_circle,
                    values: [
                      "Passenger Lift",
                      "Goods Lift",
                      "Capsule Lift",
                      "Dumbwaiter Lift",
                      "Hospital Lift"
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          showCustomDialog(
                            context,
                            onValue: (_) {},
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 58.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Search",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (pickerDate != null) {
      setState(() {
        // isStartDate ? _startDate = pickerDate : _expireDate = pickerDate;
      });
    } else {
      print("Please select Valid date !!!");
    }
  }
}
