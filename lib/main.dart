import 'package:flutter/material.dart';
import 'package:neerp/screens/CompletedActivity/completed_activity.dart';
import 'package:neerp/screens/Dashboard/dashboard_view.dart';
import 'package:neerp/screens/Lift%20List/lift_list_view.dart';
import 'package:neerp/utils/constants.dart';
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
      home: DatePickerDialogShowcase(),
    );
  }
}

class DatePickerDialogShowcase extends StatelessWidget {
  const DatePickerDialogShowcase({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: DatePickerDialog(
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime(2050),
          ),
        ),
        TextButton(
          child: const Text(
            'Show DatePickerDialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
      ],
    );
  }
}
