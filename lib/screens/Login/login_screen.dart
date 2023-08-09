import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset("assets/riv_assets/login_signup.riv"),
      ),
    );
  }
}
