import 'package:flutter/material.dart';

class AppColors {
  // 1. ألوان الخلفيات الرئيسية (Backgrounds)
  static const Color mainBackground = Color(0xffBBDEFA); // الأزرق الفاتح جداً
  static const Color fancySectionBg = Color(0xffC5CAE8); // الأرجواني الباهت للقسم الأوسط
  static const Color cardBackground = Colors.white;      // خلفية الكروت البيضاء

  // 2. ألوان النصوص (Typography)
  static const Color textPrimary = Color(0xff474DAE);    // الأزرق الداكن للعناوين
  static const Color textWhite   = Colors.white;         // للنصوص داخل المربعات الملونة

  // 3. ألوان المربعات العلوية (A, B, C)
  static const Color boxA = Color(0xffEE534F); // الأحمر
  static const Color boxB = Color(0xffFFA827); // البرتقالي
  static const Color boxC = Color(0xffFDD734); // الأصفر

  // 4. ألوان مربعات قسم الـ Fancy Section (1 to 6)
  static const Color p1 = Color(0xff7E57C2);
  static const Color p2 = Color(0xffAA47BC);
  static const Color p3 = Color(0xff9675CE);
  static const Color p4 = Color(0xffB968C7);
  static const Color p5 = Color(0xffB39DDB);
  static const Color p6 = Color(0xffCF93D9);

  // 5. ألوان كروت الإحصائيات (Info Cards)
  static const Color activeGreen    = Color(0xff2DA296);
  static const Color pendingOrange   = Color(0xffF8B11A);
  static const Color completedGreen  = Color(0xff459E4A);

  // منع إنشاء Instance من الكلاس (Private Constructor)
  AppColors._();
}