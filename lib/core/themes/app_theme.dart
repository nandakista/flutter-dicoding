import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skybase/core/themes/app_colors.dart';

final textTheme = Theme.of(Get.context!).textTheme;

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.materialPrimary,
      primarySwatch: AppColors.materialPrimary,
      toggleableActiveColor: AppColors.materialPrimary,
      indicatorColor: AppColors.accent,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          statusBarColor: AppColors.primary,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primarySwatch: AppColors.materialPrimary,
      primaryColor: AppColors.materialPrimary,
      toggleableActiveColor: AppColors.materialPrimary,
      indicatorColor: AppColors.accent,
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          statusBarColor: AppColors.primary,
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static TextTheme textTheme() {
    return const TextTheme(
      headline1: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
      ),
      // Navbar
      headline2: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
      ),
      // Banner
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      // Normal
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      headline5: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(fontSize: 12),
    );
  }

  static setStatusBar({
    required Brightness brightness,
    Color color = AppColors.primary,
  }) {
    Brightness _iconBrightness;
    if (Platform.isIOS) {
      (brightness == Brightness.dark)
          ? _iconBrightness = Brightness.light
          : _iconBrightness = Brightness.dark;
    } else {
      _iconBrightness = brightness;
    }
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: _iconBrightness,
        statusBarColor: color,
      ),
    );
  }
}

extension DarkMode on BuildContext {
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

class AppOrientation {
  static lock(DeviceOrientation orientation) {
    return SystemChrome.setPreferredOrientations([
      orientation,
    ]);
  }
}
