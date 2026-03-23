import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Backgrounds
  static const Color scaffoldBackground = Color(0xFFF8F9FB); // لون الخلفية الفاتح
  static const Color cardBackground = Colors.white;

  // Primary & Banner Colors
  static const Color bannerBackground = Color(0xFF8155BA); // البنفسجي الفاتح للبانر
  static const Color bannerButton = Color(0xFF5E35B1); // البنفسجي الغامق لزر البانر

  // Bottom Action Buttons
  static const Color settingsButton = Color(0xFF2196F3); // أزرق
  static const Color profileButton = Color(0xFFFF9800); // برتقالي

  // Text Colors
  static const Color textPrimary = Color(0xFF1D1D1D); // العناوين والأسماء
  static const Color textSecondary = Color(0xFF9E9E9E); // النصوص الفرعية (Subtitles)
  static const Color textWhite = Colors.white;

  // Icon Colors
  static const Color iconPurple = Color(0xFF5E35B1);
  static const Color iconOrange = Color(0xFFFF9800);
  static const Color iconBlue = Color(0xFF2196F3);
  
  // Icon Container Backgrounds (Soft transparent colors)
  static final Color iconBgPurple = const Color(0xFF5E35B1).withOpacity(0.1);
  static final Color iconBgBlue = const Color(0xFF2196F3).withOpacity(0.1);
  static final Color iconBgOrange = const Color(0xFFFF9800).withOpacity(0.1);
}