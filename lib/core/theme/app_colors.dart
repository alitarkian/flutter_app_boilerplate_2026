import 'package:flutter/material.dart';

abstract final class AppColors {
  const AppColors._();

  // Brand
  static const primary = Color(0xFF2563EB);
  static const primaryDark = Color(0xFF1D4ED8);

  static const secondary = Color(0xFF7C3AED);

  // Status
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFDC2626);

  // Background
  static const background = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);

  // Text
  static const textPrimary = Color(0xFF0F172A);
  static const textSecondary = Color(0xFF64748B);
  static const textHint = Color(0xFF94A3B8);

  // Border
  static const border = Color(0xFFE2E8F0);

  // Dark Splash
  static const splashStart = Color(0xFF0F172A);
  static const splashEnd = Color(0xFF1E293B);
}