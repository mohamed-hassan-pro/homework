import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;
  final int cardColorIndex;
  final TimeOfDay notificationTime;

  const SettingsState({
    required this.themeMode,
    required this.locale,
    this.cardColorIndex = 0,
    this.notificationTime = const TimeOfDay(hour: 10, minute: 0),
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    int? cardColorIndex,
    TimeOfDay? notificationTime,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      cardColorIndex: cardColorIndex ?? this.cardColorIndex,
      notificationTime: notificationTime ?? this.notificationTime,
    );
  }

  @override
  List<Object?> get props => [themeMode, locale, cardColorIndex, notificationTime];
}

/// Predefined card accent colors
class CardAccentColors {
  static const List<Color> colors = [
    Color(0xFF0D47A1), // Deep Blue (default)
    Color(0xFF1B5E20), // Emerald
    Color(0xFF4A148C), // Deep Purple
    Color(0xFFBF360C), // Deep Orange
    Color(0xFF006064), // Teal
    Color(0xFFC62828), // Rich Red
    Color(0xFF283593), // Indigo
    Color(0xFF00695C), // Dark Teal
    Color(0xFF4E342E), // Brown
    Color(0xFF37474F), // Blue Grey
  ];

  static const List<String> namesEn = [
    'Ocean Blue',
    'Emerald',
    'Royal Purple',
    'Sunset Orange',
    'Teal',
    'Ruby Red',
    'Indigo',
    'Forest Teal',
    'Cocoa',
    'Storm Grey',
  ];

  static const List<String> namesAr = [
    'أزرق محيطي',
    'أخضر زمردي',
    'بنفسجي ملكي',
    'برتقالي غروب',
    'تركوازي',
    'أحمر ياقوتي',
    'نيلي',
    'تركوازي عميق',
    'كاكاو',
    'رمادي عاصف',
  ];

  static Color get(int index) => colors[index.clamp(0, colors.length - 1)];
}
