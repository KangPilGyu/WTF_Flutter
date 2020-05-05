
import 'package:flutter/material.dart';

enum AppTheme {
  PinkLight,
  PinkDark
}

final appThemeData = {
  AppTheme.PinkLight : ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink
  ),
  AppTheme.PinkDark : ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pink
  ),
};