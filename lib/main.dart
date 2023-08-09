// ignore_for_file: unused_import, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:neerp/screens/Add%20Lift/addLift.dart';
import 'package:neerp/screens/Add%20User/addUser.dart';
import 'package:neerp/screens/CompletedActivity/completed_activity.dart';
import 'package:neerp/screens/Dashboard/dashboard_view.dart';
import 'package:neerp/screens/Lift%20List/lift_list_view.dart';
import 'package:neerp/utils/scrollBehaviour.dart';
import 'package:neerp/utils/theme/theme.dart';
import 'package:neerp/utils/theme/theme_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeMode themeMode = ThemeMode.light;
  bool longLabel = false;
  TextDirection textDirection = TextDirection.ltr;
  ThemeSettings settings = const ThemeSettings(
    useMaterial3: true,
    useCustomTheme: true,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyBehavior(),
      title: 'Neerp',
      themeMode: themeMode,
      theme: theme(ThemeMode.light, settings),
      darkTheme: theme(ThemeMode.dark, settings),
      home: AddLift(),
    );
  }
}
