import 'package:flutter/material.dart';

/// FootyFly Design System - Colors
/// Dark-first, premium football aesthetic
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF0B0F1A);
  static const Color surface = Color(0xFF151B2D);
  static const Color surfaceElevated = Color(0xFF1C2438);
  static const Color surfaceHighest = Color(0xFF252E45);

  // Brand / Accent
  static const Color primary = Color(0xFF00E676); // Electric Emerald
  static const Color primaryDim = Color(0xFF00C853);
  static const Color live = Color(0xFF00F0FF); // Cyan pulse for live matches
  static const Color secondary = Color(0xFF7C4DFF);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8B95A8);
  static const Color textTertiary = Color(0xFF5A6478);
  static const Color textDisabled = Color(0xFF3D4659);

  // Semantic
  static const Color success = Color(0xFF00E676);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFFF3B5C);
  static const Color info = Color(0xFF40C4FF);

  // Match specific
  static const Color homeTeam = Color(0xFF00E676);
  static const Color awayTeam = Color(0xFF40C4FF);
  static const Color draw = Color(0xFF8B95A8);

  // Borders & Dividers
  static const Color border = Color(0xFF2A3347);
  static const Color divider = Color(0xFF1F2738);

  // Overlay
  static const Color overlay = Color(0x99000000);
  static const Color glass = Color(0x1AFFFFFF);
}
