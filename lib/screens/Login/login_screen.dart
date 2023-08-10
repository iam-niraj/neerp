import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late RiveAnimationController _animationController;

  @override
  void initState() {
    _animationController = OneShotAnimation(
      "Appearing",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          "assets/riv_assets/login_animation.riv",
          controllers: [_animationController],
        ),
      ),
    );
  }
}
