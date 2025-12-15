// app_theme.dart
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color success;
  final Color successContainer;
  final Color warning;
  final Color warningContainer;

  const AppColors({
    required this.success,
    required this.successContainer,
    required this.warning,
    required this.warningContainer,
  });

  @override
  AppColors copyWith({
    Color? success,
    Color? successContainer,
    Color? warning,
    Color? warningContainer,
  }) {
    return AppColors(
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
    );
  }
}

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  // quick global tweaks
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      success: Color(0xFF2E7D32), // green 700
      successContainer: Color.fromARGB(255, 197, 237, 200), // light green bg
      warning: Color(0xFFEF6C00), // deep orange 600
      warningContainer: Color(0xFFFFF3E0), // light orange bg
    ),
  ],
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      success: Color(0xFF66BB6A), // lighter green for dark mode
      successContainer: Color(0xFF0F3D17), // dark green container
      warning: Color(0xFFFFB74D), // lighter orange
      warningContainer: Color(0xFF3E2A00), // dark amber container
    ),
  ],
);
