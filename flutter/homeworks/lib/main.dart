import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/3_bmi_calculator/screens/bmi_calculator_screen.dart';
import 'package:homeworks/4_to_do_app/to_do_screen.dart';

void main() {
  runApp(DevicePreview(builder: (context) => ToDoScreen()));
}
