import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'app.dart';
import 'core/services/storage_service.dart';
import 'core/services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Hive Init
  await Hive.initFlutter();
  await StorageService.init();

  // Dio Init
  ApiService.init();

  // Timezones for Notifications
  tz.initializeTimeZones();

  runApp(const AyyamApp());
}
