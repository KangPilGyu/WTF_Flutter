import 'package:flutter/cupertino.dart';
import 'package:wtf_main/core/models/app_setting.dart';
import 'package:wtf_main/core/services/app_setting_service.dart';
import 'package:wtf_main/ui/shared/app_themes.dart';
import '../../locator.dart';

class AppSettingModel with ChangeNotifier {
  final AppSettingService _appSettingService = locator<AppSettingService>();

  AppSetting getAppSetting() {
    return _appSettingService.getAppSetting();
  }

  void changeAppTheme(AppTheme appTheme) {
    _appSettingService.changeAppSetting(appTheme);
    notifyListeners();
  }
}
