// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:neerp/screens/Add%20Lift/addLift.dart';
import 'package:neerp/screens/Add%20User/addUser.dart';
import 'package:neerp/screens/Dashboard/dashboard_view.dart';
import 'package:neerp/screens/Lift%20List/lift_list_view.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/scrollBehaviour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyBehavior(),
      title: 'Neerp',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        fontFamily: "SFNSDisplay",
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: AddLift(),
    );
  }
}
