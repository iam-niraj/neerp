// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, sort_child_properties_last, unused_field, unused_import, avoid_print, unused_label, unnecessary_const

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/dropDown.dart';
import 'package:neerp/utils/extensions.dart';
import 'package:neerp/utils/inputField.dart';
import 'package:neerp/utils/inputText.dart';

class AddLift extends StatefulWidget {
  AddLift() : super();

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 2.0.hp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Lift",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.0.hp,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      labelText: "Site name",
                      icon: Icons.home,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      labelText: "Site address",
                      icon: Icons.location_pin,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      labelText: "Customer name",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      controller: _emailController,
                      labelText: "Email",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      labelText: "Phone number",
                      icon: Icons.phone,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      labelText: "Number of lifts",
                      icon: Icons.format_list_numbered,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      labelText: "Number of floors",
                      icon: Icons.house,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    DropDownWidget(
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
                    DropDownWidget(
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
                    InputField(
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
                    InputField(
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
                    InputTextWidget(
                      labelText: "Number of services",
                      icon: Icons.miscellaneous_services_sharp,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                      labelText: "Amount",
                      icon: Icons.attach_money_sharp,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    //   height: textHt,
                    //   width: textWt,
                    //   // decoration: BoxDecoration(
                    //   //   color: Colors.white,
                    //   //   borderRadius: BorderRadius.all(
                    //   //     Radius.circular(20),
                    //   //   ),
                    //   // ),
                    //   child: DropdownButtonFormField(
                    //     decoration: InputDecoration(
                    //       prefixIcon: Container(
                    //         margin: EdgeInsets.symmetric(
                    //           horizontal: 2.0.wp,
                    //         ),
                    //         height: textWt / 8,
                    //         width: textWt / 8,
                    //         child: Stack(
                    //           children: [
                    //             Positioned.fill(
                    //                 child: Image.asset("assets/images/bg.png")),
                    //             Positioned.fill(
                    //               child: Icon(
                    //                 Icons.list_outlined,
                    //                 color: kPrimaryColor,
                    //                 size: 32.0, /*Color(0xff224597)*/
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       labelText: "Amc type",
                    //       labelStyle:
                    //           TextStyle(color: Colors.black54, fontSize: 18.0),
                    //       hintText: '',
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey),
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(20),
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: kPrimaryColor),
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(20),
                    //         ),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(20),
                    //         ),
                    //       ),
                    //     ),
                    //     items: [
                    //       DropdownMenuItem(
                    //         child: Text("Comprehensive"),
                    //         value: "menuone",
                    //         //make true to take width of parent widget
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("Non-Comprehensive"),
                    //         value: "menutwo",
                    //         //make true to take width of parent widget
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("Semi-Comprehensive"),
                    //         value: "menuthree",
                    //       ),
                    //     ],
                    //     onChanged: (value) {},
                    //     isExpanded: false,
                    //     style: TextStyle(fontSize: 18, color: Colors.black54),
                    //     iconEnabledColor: kPrimaryColor, //Icon color
                    //   ),
                    // ),
                    SizedBox(
                      height: 3.0.hp,
                    ),
                    Container(
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kSecondaryColor,
                          elevation: 0.0,
                          minimumSize: Size(screenWidth, 150),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: kPrimaryColor,
                                    offset: const Offset(1.1, 1.1),
                                    blurRadius: 10.0),
                              ],
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Container(
                            alignment: Alignment.center,
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
    builder:
    (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: kPrimaryColor,
            onBackground: kPrimaryColor,
          ),
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: kPrimaryColor,
            backgroundColor: kPrimaryColor,
            headerForegroundColor: kPrimaryColor,
            surfaceTintColor: kPrimaryColor,
          ),
        ),
        child: child,
      );
    };
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
}
