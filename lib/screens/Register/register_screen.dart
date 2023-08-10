// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/screens/Login/login_screen.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/textButton.dart';
import 'package:neerp/utils/components/text_field.dart';
import 'package:neerp/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisibility = true;
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/images/back_arrow.svg',
            width: 24.w,
            color: black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: kHeadline,
                          ),
                          Text(
                            "Create new account to get started.",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          MyTextField(
                              labelText: "Full name",
                              icon: Icons.person,
                              obscureText: false,
                              keyboardType: TextInputType.text),
                          MyTextField(
                            controller: _emailController,
                            labelText: "Email",
                            icon: Icons.email,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          MyTextField(
                            labelText: "Phone number",
                            icon: Icons.phone,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                          ),
                          MyTextField(
                            labelText: "Username",
                            icon: Icons.person_pin_rounded,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                          ),
                          MyTextField(
                            labelText: "Password",
                            icon: Icons.lock,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Log In",
                            style: kBodyText.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () {},
                      bgColor: kPrimaryColor,
                      textColor: white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
