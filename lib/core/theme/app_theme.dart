import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.luxWhite),

      scaffoldBackgroundColor: AppColors.luxWhite,

      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(52)),
      ),
    );
  }
}
