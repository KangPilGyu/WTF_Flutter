import 'package:flutter/material.dart';
import 'package:wtf_main/ui/shared/app_themes.dart';

class AppSetting {
  ThemeData appTheme;

  AppSetting({this.appTheme});

  AppSetting.initial()
      : appTheme = appThemeData[AppTheme.PinkLight];
}