// A seed color for the M3 ColorScheme.
import 'package:flutter/material.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/theme/theme_settings.dart';

const Color seedColor = Color(0xFF6750A4);
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
    fontFamily: "Poppins",
    colorScheme: colorScheme,
    useMaterial3: settings.useMaterial3,
    visualDensity: VisualDensity.standard,
    /* datePickerTheme: settings.useCustomTheme
        ? DatePickerThemeData(
            headerBackgroundColor: colorScheme.tertiaryContainer,
            headerForegroundColor: colorScheme.onTertiaryContainer,
          )
        : null, */
  );
}
