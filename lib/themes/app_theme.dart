import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';

class AppTheme{
  static lightTheme({required context}){
    final lightTheme = Theme.of(context).copyWith(
        colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColor.googleRed, onPrimary: AppColor.googleRed, secondary: AppColor.googleBlue, onSecondary: AppColor.googleBlue, error: AppColor.googleRed, onError: AppColor.googleRed, background: AppColor.background, onBackground: AppColor.background, surface: AppColor.white, onSurface: AppColor.white)
    );
    return lightTheme;
  }
}