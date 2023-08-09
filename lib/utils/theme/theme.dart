// A seed color for the M3 ColorScheme.
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
    scaffoldBackgroundColor: const Color(0xFFEEF1F8),
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
            backgroundColor: white)
        : null,
    inputDecorationTheme: settings.useCustomTheme
        ? const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
          )
        : null,
  );
}
