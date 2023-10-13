import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: AppColor.baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColor.baseColor),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFA6A3A0)),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(fontSize: 15, color: Colors.grey),
        titleLarge: TextStyle(fontSize: 12)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
