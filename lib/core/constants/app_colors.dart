import 'package:flutter/material.dart';

/// Centralized color constants for the app
/// Separating colors makes it easy to update the design system
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary colors - used for main actions, app bar, etc.
  static const Color primaryLight = Color(0xFF6366F1); // Indigo
  static const Color primaryDark = Color(0xFF818CF8);  // Lighter indigo for dark mode

  // Secondary colors - used for accents, FABs, etc.
  static const Color secondaryLight = Color(0xFFEC4899); // Pink
  static const Color secondaryDark = Color(0xFFF472B6);  // Lighter pink for dark mode

  // Background colors
  static const Color backgroundLight = Color(0xFFF8FAFC); // Light gray-blue
  static const Color backgroundDark = Color(0xFF0F172A);  // Dark blue-gray

  // Surface colors - for cards, sheets, etc.
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E293B);

  // Text colors
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  // Status colors
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
}
