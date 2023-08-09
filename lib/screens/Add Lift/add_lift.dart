import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/components/drop_down_text_field.dart';
import 'package:neerp/utils/components/date_text_field.dart';
import 'package:neerp/utils/components/text_field.dart';

class AddLift extends StatefulWidget {
  const AddLift({super.key});

  @override
  _AddLiftState createState() => _AddLiftState();
}

class _AddLiftState extends State<AddLift> {
  final _formKey = GlobalKey<FormState>();
  /* final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController(); */
  final TextEditingController _emailController = TextEditingController();
  final textHt = Get.height - 90.0.h;
  final textWt = Get.width - 10.0.w;
  DateTime _startDate = DateTime.now();
  DateTime _expireDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(
                title: "Add Lift",
              ),
              SizedBox(
                height: 24.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const MyTextField(
                      labelText: "Site name",
                      icon: Icons.home,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    const MyTextField(
                      labelText: "Site address",
                      icon: Icons.location_pin,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    const MyTextField(
                      labelText: "Customer name",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    MyTextField(
                      controller: _emailController,
                      labelText: "Email",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const MyTextField(
                      labelText: "Phone number",
                      icon: Icons.phone,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    const MyTextField(
                      labelText: "Number of lifts",
                      icon: Icons.format_list_numbered,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    const MyTextField(
                      labelText: "Number of floors",
                      icon: Icons.house,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    const DropDownTextField(
                      labelText: "AMC type",
                      icon: Icons.list_alt,
                      values: [
                        "Comprehensive",
                        "Non-Comprehensive",
                        "Semi-Comprehensive"
                      ],
                    ),
                    const DropDownTextField(
                      labelText: "Lift type",
                      icon: Icons.elevator_sharp,
                      values: [
                        "Passenger Lift",
                        "Goods Lift",
                        "Capsule Lift",
                        "Dumbwaiter Lift",
                        "Hospital Lift"
                      ],
                    ),
                    DateTextField(
                      title: "Start Date",
                      icon: Icons.calendar_month_outlined,
                      hint: DateFormat.yMd().format(_startDate),
                      onTap: () {
                        _getDateFromUser(true);
                      },
                    ),
                    DateTextField(
                      title: "Expire Date",
                      icon: Icons.calendar_month_sharp,
                      hint: DateFormat.yMd().format(_expireDate),
                      onTap: () {
                        _getDateFromUser(false);
                      },
                    ),
                    const MyTextField(
                      labelText: "Number of services",
                      icon: Icons.miscellaneous_services_sharp,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    const MyTextField(
                      labelText: "Amount",
                      icon: Icons.attach_money_sharp,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
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
                              "Continue",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser(bool isStartDate) async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (pickerDate != null) {
      setState(() {
        isStartDate ? _startDate = pickerDate : _expireDate = pickerDate;
      });
    } else {
      if (kDebugMode) {
        print("Please select Valid date !!!");
      }
    }
  }

  // Future<void> _openDialog(BuildContext context) async {
  //   await showDialog<void>(
  //     context: context,
  //     useRootNavigator: false,
  //     builder: (BuildContext context) => DatePickerDialog(
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1930),
  //       lastDate: DateTime(2050),
  //     ),
  //   );
  // }
}
