
import 'package:flutter/material.dart';

class ProjectTheme{

  static ThemeData getCurrentTheme() => applicationDefaultTheme;

  static ThemeData applicationDefaultTheme = ThemeData(
    fontFamily: "Gotham",
    primaryColor: Color(0xFF334188),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Color(0xFF1f20a3),
  );
}