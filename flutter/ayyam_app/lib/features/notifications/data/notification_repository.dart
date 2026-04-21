import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/routing/app_router.dart';
import '../../home/data/models/islamic_event.dart';

class NotificationRepository {
  static const _platform = MethodChannel('com.ayyam.app/settings');
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidInit, iOS: iosInit);

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  Future<bool> isPermissionGranted() async {
    return await Permission.notification.isGranted;
  }

  Future<bool> requestPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  Future<void> openSystemSettings() async {
    await openAppSettings();
  }

  /// Opens the native Android ringtone picker and returns the selected URI.
  Future<String?> pickSystemRingtone() async {
    try {
      final String? uri = await _platform.invokeMethod('pickRingtone');
      return uri;
    } on PlatformException {
      return null;
    }
  }

  void _onNotificationTap(NotificationResponse response) {
    if (response.payload != null && response.payload!.isNotEmpty) {
      AppRouter.router.go('/event/${response.payload}');
    }
  }

  Future<void> scheduleAll(List<IslamicEvent> events) async {
    await _plugin.cancelAll();

    final prefs = [7, 30, 90, 180];
    final activePrefs = prefs.where((days) => StorageService.getNotificationPreference(days)).toList();

    if (activePrefs.isEmpty) return;

    final targetHour = StorageService.getNotificationHour();
    final targetMinute = StorageService.getNotificationMinute();
    final soundUri = StorageService.getNotificationSoundUri();

    for (final event in events) {
      if (event.isPassed) continue;

      for (final days in activePrefs) {
        final triggerDate = event.gregorianDate.subtract(Duration(days: days));
        final scheduledTime = DateTime(triggerDate.year, triggerDate.month, triggerDate.day, targetHour, targetMinute);

        if (scheduledTime.isAfter(DateTime.now())) {
          _schedule(
            id: _generateId(event.id, days),
            title: '🌙 ${event.nameAr}',
            body: 'باقي $days أيام على ${event.nameAr}',
            scheduledTime: scheduledTime,
            payload: event.id,
            soundUri: soundUri,
          );
        }
      }
    }
  }

  Future<void> _schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required String payload,
    String? soundUri,
  }) async {
    final details = _getNotificationDetails(soundUri);

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      details,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  Future<bool> showTestNotification(String title, String body) async {
    final granted = await isPermissionGranted();
    if (!granted) return false;

    final soundUri = StorageService.getNotificationSoundUri();
    final details = _getNotificationDetails(soundUri);

    await _plugin.show(
      9999,
      title,
      body,
      details,
    );
    return true;
  }

  NotificationDetails _getNotificationDetails(String? soundUri) {
    // Android channel IDs are immutable regarding sound.
    // Changing sound requires a NEW channel ID.
    // We hash the sound URI to create a unique channel per sound choice.
    final soundKey = soundUri ?? 'default';
    final channelHash = soundKey.hashCode.abs().toString();
    final channelId = 'ayyam_events_ch_$channelHash';
    const channelName = 'Ayyam Events';

    AndroidNotificationSound? androidSound;
    if (soundUri != null) {
      androidSound = UriAndroidNotificationSound(soundUri);
    }

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: 'Notifications for upcoming Islamic events',
      importance: Importance.max,
      priority: Priority.high,
      sound: androidSound,
      playSound: true,
      icon: '@mipmap/ic_launcher',
    );

    // iOS: null sound = default iPhone notification tone
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    return NotificationDetails(android: androidDetails, iOS: iosDetails);
  }

  int _generateId(String eventId, int days) {
    return (eventId.hashCode + days).abs() % 100000;
  }
}
