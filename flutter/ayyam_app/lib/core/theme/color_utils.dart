import 'package:flutter/material.dart';

class ColorUtils {
  /// Maps remaining days to a color on the spectrum:
  ///   ≥ 180 days → Deep Teal (calm)
  ///   90–179    → Blue
  ///   30–89     → Amber/Gold
  ///   7–29      → Orange
  ///   1–6       → Deep Red (urgent)
  ///   0 (today) → Pulsing Gold (celebration)
  ///   < 0       → Grey (passed)
  ///
  /// Uses HSL interpolation for smooth transitions within each band.
  static Color getUrgencyColor(int remainingDays) {
    if (remainingDays < 0) return Colors.grey.shade800;
    if (remainingDays == 0) return const Color(0xFFFFD700); // Gold
    
    // Normalize: clamp to [0, 365], invert so urgency = 1.0 when near
    double t = (remainingDays.clamp(0, 365)) / 365.0;
    // HSL hue: 0 (red/urgent) → 180 (teal/calm)
    double hue = t * 180;
    return HSLColor.fromAHSL(1.0, hue, 0.7, 0.45).toColor();
  }
}
