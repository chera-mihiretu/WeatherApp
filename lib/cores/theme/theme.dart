import 'package:flutter/material.dart';

class MyTheme {
  static const String poppins = 'Poppins';
  static const Color backgroundDark = Color.fromARGB(255, 19, 125, 245);
  static const Color backgroundLight = Color.fromARGB(255, 20, 177, 248);
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displayMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      displaySmall: TextStyle(
          fontFamily: poppins,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      headlineLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      headlineMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      headlineSmall: TextStyle(
          fontFamily: poppins,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      titleLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black),
      titleMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black),
      titleSmall: TextStyle(
          fontFamily: poppins,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black),
      bodyLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black),
      bodyMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black),
      bodySmall: TextStyle(
          fontFamily: poppins,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black),
      labelLarge: TextStyle(
          fontFamily: poppins,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      labelMedium: TextStyle(
          fontFamily: poppins,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      labelSmall: TextStyle(
          fontFamily: poppins,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      titleMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      titleSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white),
      bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white),
      bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white),
      labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    ),
  );

  static TextStyle costumHeader = TextStyle(
    fontSize: 120,
    fontWeight: FontWeight.bold,
  );
}
