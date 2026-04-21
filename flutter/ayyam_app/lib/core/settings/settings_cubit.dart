import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(_getInitialState());

  static SettingsState _getInitialState() {
    // Determine Theme
    final themeStr = StorageService.getThemeMode();
    ThemeMode themeMode = ThemeMode.system;
    if (themeStr == 'light') themeMode = ThemeMode.light;
    if (themeStr == 'dark') themeMode = ThemeMode.dark;

    // Determine Locale
    final langStr = StorageService.getLanguageMode();
    Locale locale;
    if (langStr == null) {
      final platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
      locale = Locale(platformLocale.languageCode == 'ar' ? 'ar' : 'en');
    } else {
      locale = Locale(langStr);
    }

    // Card color
    final cardColorIndex = StorageService.getCardColorIndex();

    // Notification time
    final notifHour = StorageService.getNotificationHour();
    final notifMinute = StorageService.getNotificationMinute();

    return SettingsState(
      themeMode: themeMode,
      locale: locale,
      cardColorIndex: cardColorIndex,
      notificationTime: TimeOfDay(hour: notifHour, minute: notifMinute),
    );
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    String themeStr = 'system';
    if (themeMode == ThemeMode.light) themeStr = 'light';
    if (themeMode == ThemeMode.dark) themeStr = 'dark';
    
    await StorageService.saveThemeMode(themeStr);
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> changeLanguage(String languageCode) async {
    await StorageService.saveLanguageMode(languageCode);
    emit(state.copyWith(locale: Locale(languageCode)));
  }

  Future<void> changeCardColor(int colorIndex) async {
    await StorageService.saveCardColorIndex(colorIndex);
    emit(state.copyWith(cardColorIndex: colorIndex));
  }

  Future<void> changeNotificationTime(TimeOfDay time) async {
    await StorageService.saveNotificationTime(time.hour, time.minute);
    emit(state.copyWith(notificationTime: time));
  }
}
