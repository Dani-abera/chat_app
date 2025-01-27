import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4A90E2), // Soft blue
    hintColor: const Color(0xFFFFC107), // Light grey
    scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White
    cardColor: const Color(0xFFF1F3F6), // Off-white
    dividerColor: const Color(0xFFDDDDDD), // Light divider
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF4A90E2), // FAB color
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF4A90E2), // AppBar background
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white), // Icon color
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF1F3F6), // Input background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      headlineLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      bodySmall: TextStyle(fontSize: 12, color: Colors.black),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF4A90E2)),
      labelMedium: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[700]),
      labelSmall: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey[500]),
    ),
    iconTheme:
        const IconThemeData(color: Color(0xFF4A90E2)), // Default icon color
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1E88E5), // Deep blue
    hintColor: const Color(0xFFFFA000), // Dark grey
    scaffoldBackgroundColor: const Color(0xFF1E1E1E), // Charcoal grey
    cardColor: const Color(0xFF2C2C2C), // Medium grey
    dividerColor: const Color(0xFF444444), // Subtle divider
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF1E88E5), // FAB color
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E), // AppBar background
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white), // Icon color
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2C2C2C), // Input background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      displaySmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      headlineLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      titleSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white),
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFFFA000)),
      labelMedium: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[400]),
      labelSmall: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey[500]),
    ),
    iconTheme:
        const IconThemeData(color: Color(0xFFFFA000)), // Default icon color
  );
}
