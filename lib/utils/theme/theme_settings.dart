import 'package:flutter/foundation.dart';

@immutable
class ThemeSettings with Diagnosticable {
  final bool useMaterial3;
  final bool useCustomTheme;

  const ThemeSettings({
    required this.useMaterial3,
    required this.useCustomTheme,
  });

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('useMaterial3', useMaterial3));
    properties.add(DiagnosticsProperty<bool>('useCustomTheme', useCustomTheme));
  }

  /// Copy the object with one or more provided properties changed.
  ThemeSettings copyWith({
    bool? useMaterial3,
    bool? useCustomTheme,
    bool? useIndicatorWidth,
    bool? useTileHeight,
  }) {
    return ThemeSettings(
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      useCustomTheme: useCustomTheme ?? this.useCustomTheme,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ThemeSettings &&
        other.useMaterial3 == useMaterial3 &&
        other.useCustomTheme == useCustomTheme;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        useMaterial3.hashCode,
        useCustomTheme.hashCode,
      ]);
}
