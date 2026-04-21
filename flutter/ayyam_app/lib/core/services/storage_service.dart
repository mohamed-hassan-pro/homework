import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';
import '../../features/home/data/models/islamic_event.dart';

class StorageService {
  static late Box userBox;
  static late Box prefsBox;
  static late Box<IslamicEvent> eventsBox;
  static late Box metaBox;

  static Future<void> init() async {
    // Register adapter
    Hive.registerAdapter(IslamicEventAdapter());

    // Open boxes
    userBox = await Hive.openBox(AppConstants.userBox);
    prefsBox = await Hive.openBox(AppConstants.prefsBox);
    eventsBox = await Hive.openBox<IslamicEvent>(AppConstants.eventsBox);
    metaBox = await Hive.openBox(AppConstants.metaBox);
  }

  // User
  static Future<void> saveUser(String name, String email, String phone) async {
    await userBox.putAll({
      'name': name,
      'email': email,
      'phone': phone,
      'is_onboarded': true,
    });
  }

  static Future<void> resetOnboarding() async {
    await userBox.put('is_onboarded', false);
  }

  static bool get isOnboarded => userBox.get('is_onboarded', defaultValue: false);

  // Preferences (Saved as true/false for keys like '7_days', '30_days', etc.)
  static Future<void> saveNotificationPreference(int days, bool enabled) async {
    await prefsBox.put('${days}_days', enabled);
  }

  static bool getNotificationPreference(int days) {
    return prefsBox.get('${days}_days', defaultValue: false);
  }

  // Showcase
  static Future<void> saveHasSeenShowcase(bool value) async {
    await prefsBox.put('has_seen_showcase', value);
  }

  static bool getHasSeenShowcase() {
    return prefsBox.get('has_seen_showcase', defaultValue: false);
  }

  // Meta info
  static DateTime? getLastSyncTimestamp() {
    final ms = metaBox.get('last_sync_timestamp');
    return ms != null ? DateTime.fromMillisecondsSinceEpoch(ms) : null;
  }

  static Future<void> updateSyncTimestamp() async {
    await metaBox.put('last_sync_timestamp', DateTime.now().millisecondsSinceEpoch);
  }

  // Settings
  static Future<void> saveLanguageMode(String languageCode) async {
    await prefsBox.put('language_code', languageCode);
  }

  static String? getLanguageMode() {
    return prefsBox.get('language_code');
  }

  static Future<void> saveThemeMode(String themeStr) async {
    await prefsBox.put('theme_mode', themeStr);
  }

  static String? getThemeMode() {
    return prefsBox.get('theme_mode');
  }

  static Future<void> saveCardColorIndex(int index) async {
    await prefsBox.put('card_color_index', index);
  }

  static int getCardColorIndex() {
    return prefsBox.get('card_color_index', defaultValue: 0);
  }

  // Notification time (stored as hour and minute)
  static Future<void> saveNotificationTime(int hour, int minute) async {
    await prefsBox.put('notification_hour', hour);
    await prefsBox.put('notification_minute', minute);
  }

  static int getNotificationHour() {
    return prefsBox.get('notification_hour', defaultValue: 10);
  }

  static int getNotificationMinute() {
    return prefsBox.get('notification_minute', defaultValue: 0);
  }

  static Future<void> saveNotificationSound(String soundName) async {
    await prefsBox.put('notification_sound', soundName);
  }

  static String getNotificationSound() {
    return prefsBox.get('notification_sound', defaultValue: 'default');
  }

  static Future<void> saveNotificationSoundUri(String? uri) async {
    await prefsBox.put('notification_sound_uri', uri);
  }

  static String? getNotificationSoundUri() {
    return prefsBox.get('notification_sound_uri');
  }

  // Forced Showcase flag
  static Future<void> saveForceShowcase(bool value) async {
    await prefsBox.put('force_showcase', value);
  }

  static bool getForceShowcase() {
    return prefsBox.get('force_showcase', defaultValue: false);
  }
}
