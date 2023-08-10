import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/screens/Register/register_screen.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/textButton.dart';
import 'package:neerp/utils/components/text_field.dart';
import 'package:neerp/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
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
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back.",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "You've been missed!",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 60.h,
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
                          // MyPasswordField(
                          //   isPasswordVisible: isPasswordVisible,
                          //   onTap: () {
                          //     setState(() {
                          //       isPasswordVisible = !isPasswordVisible;
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyTextButton(
                      buttonName: 'Sign In',
                      onTap: () {},
                      bgColor: kPrimaryColor,
                      textColor: white,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
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
