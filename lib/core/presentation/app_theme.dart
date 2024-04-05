import 'package:flutter/material.dart';
import 'package:money_expense_dot/core/presentation/app_color.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SourceSans',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primary,
      onPrimary: AppColor.background,
      secondary: AppColor.secondary,
      onSecondary: AppColor.background,
      error: Colors.red,
      onError: AppColor.background,
      background: AppColor.background,
      onBackground: AppColor.textPrimary,
      surface: AppColor.background,
      onSurface: AppColor.textPrimary,
      onTertiary: AppColor.textSecondary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColor.background,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColor.textSecondary,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColor.textSecondary,
        fontSize: 12,
      ),
    ),
  );
}
