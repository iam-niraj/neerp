import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/components/drop_down_text_field.dart';
import 'package:neerp/utils/extensions.dart';
import 'package:neerp/utils/components/date_text_field.dart';
import 'package:neerp/utils/components/text_field.dart';

class AddLift extends StatefulWidget {
  const AddLift({super.key});

  @override
  _AddLiftState createState() => _AddLiftState();
}

class _AddLiftState extends State<AddLift> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final textHt = Get.height - 90.0.hp;
  final textWt = Get.width - 10.0.wp;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                width: 40.0.wp,
                title: "Add Lift",
              ),
              SizedBox(
                height: 4.0.hp,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      labelText: "Site name",
                      icon: Icons.home,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Site address",
                      icon: Icons.location_pin,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Customer name",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      controller: _emailController,
                      labelText: "Email",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Phone number",
                      icon: Icons.phone,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Number of lifts",
                      icon: Icons.format_list_numbered,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Number of floors",
                      icon: Icons.house,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    DropDownTextField(
                      labelText: "AMC type",
                      icon: Icons.list_alt,
                      values: [
                        "Comprehensive",
                        "Non-Comprehensive",
                        "Semi-Comprehensive"
                      ],
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    DropDownTextField(
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
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    DateTextField(
                      title: "Start Date",
                      icon: Icons.calendar_month_outlined,
                      hint: DateFormat.yMd().format(_selectedDate),
                      onTap: () {
                        _getDateFromUser();
                      },
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    DateTextField(
                      title: "Expire Date",
                      icon: Icons.calendar_month_sharp,
                      hint: DateFormat.yMd().format(_selectedDate),
                      onTap: () {
                        _getDateFromUser();
                      },
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Number of services",
                      icon: Icons.miscellaneous_services_sharp,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    MyTextField(
                      labelText: "Amount",
                      icon: Icons.attach_money_sharp,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 7.0.hp,
                        width: textWt,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.hp,
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

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
        print(_selectedDate);
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
