// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, sort_child_properties_last, unused_field, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/utils/dropDown.dart';
import 'package:neerp/utils/inputText.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/extensions.dart';

class AddUser extends StatefulWidget {
  AddUser() : super();

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final textHt = Get.height - 90.0.hp;
  final textWt = Get.width - 10.0.wp;

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
                "Add User",
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
                        labelText: "Full name",
                        icon: Icons.person,
                        obscureText: false,
                        keyboardType: TextInputType.text),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                        controller: _emailController,
                        labelText: "Email",
                        icon: Icons.email,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                        labelText: "Phone number",
                        icon: Icons.phone,
                        obscureText: false,
                        keyboardType: TextInputType.number),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                        labelText: "Username",
                        icon: Icons.person_pin_rounded,
                        obscureText: false,
                        keyboardType: TextInputType.text),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    InputTextWidget(
                        labelText: "Password",
                        icon: Icons.lock,
                        obscureText: true,
                        keyboardType: TextInputType.text),
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
                              "Submit",
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
}
