// A seed color for the M3 ColorScheme.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/theme/theme_settings.dart';

const Color seedColor = kPrimaryColor;
// Make M3 ColorSchemes from a seed color.
final ColorScheme schemeLight = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: seedColor,
);
final ColorScheme schemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: seedColor,
);

ThemeData theme(ThemeMode mode, ThemeSettings settings) {
  final ColorScheme colorScheme =
      mode == ThemeMode.light ? schemeLight : schemeDark;

  return ThemeData(
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      barBackgroundColor: kGlassyColor,
      scaffoldBackgroundColor: Color(0xFFe7eefb),
    ),
    scaffoldBackgroundColor: const Color(0xFFe7eefb),
    fontFamily: "Intel",
    colorScheme: colorScheme,
    useMaterial3: settings.useMaterial3,
    visualDensity: VisualDensity.standard,
    dividerTheme: settings.useCustomTheme
        ? const DividerThemeData(color: kPrimaryColor, space: 0)
        : null,
    datePickerTheme: settings.useCustomTheme
        ? const DatePickerThemeData(
            headerBackgroundColor: kPrimaryColor,
            headerForegroundColor: white,
            backgroundColor: Colors.white)
        : null,
    inputDecorationTheme: settings.useCustomTheme
        ? const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFe7eefb),
          )
        : null,
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     textStyle: const TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontFamily: "Intel",
    //     ),
    //     foregroundColor: Colors.white, // color of button's letters
    //     backgroundColor: kPrimaryColor, // Background color
    //     shape: RoundedRectangleBorder(
    //       side: const BorderSide(
    //         color: Colors.transparent,
    //         width: 1,
    //         style: BorderStyle.solid,
    //       ),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //   ),
    // ),
  );
}
