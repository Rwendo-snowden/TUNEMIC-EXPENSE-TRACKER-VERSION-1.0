import 'package:flutter/material.dart';

class Tapptheme {
  static ThemeData lighttheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.amber,
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 228, 227, 227),
      ),
      scaffoldBackgroundColor: Colors.white);

  static ThemeData darktheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme:
          AppBarTheme(backgroundColor: const Color.fromARGB(255, 16, 14, 14)));
}
