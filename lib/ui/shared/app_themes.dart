
import 'package:flutter/material.dart';

enum AppTheme {
  PinkLight,
  PinkDark
}

final appThemeData = {
  AppTheme.PinkLight : ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink,
    accentColor: Colors.deepOrange
  ),
  AppTheme.PinkDark : ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.pink,
    accentColor: Colors.deepOrange

  ),
};