import 'package:flutter/material.dart';
import 'package:moneytracka_test/app_themes/app_colors.dart';

class AppTextStyle {
  // app text style for normal font
  static TextStyle regular() {
    return TextStyle(
        fontSize: 17,
        color: AppColors.blackColor,
        fontWeight: FontWeight.normal);
  }

// app text style for bold font
  static TextStyle bold() {
    return TextStyle(
        fontSize: 17, color: AppColors.blackColor, fontWeight: FontWeight.bold);
  }
}
