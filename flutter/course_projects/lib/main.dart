import 'package:course_projects/2_Basketball_points_counter_app/basketball_points_counter_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import '1_business_card_app/business_card_screen.dart';

void main() {
  runApp(DevicePreview(builder: (context) => BasketballPointsCounterScreen()));
}