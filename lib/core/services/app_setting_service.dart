import 'package:wtf_main/core/models/app_setting.dart';
import 'package:wtf_main/ui/shared/app_themes.dart';

class AppSettingService {
  AppSetting appSetting = AppSetting.initial();

  void changeAppSetting(AppTheme appTheme) {
    //print(appSetting.appTheme.brightness.toString());
    appSetting = AppSetting(appTheme: appThemeData[appTheme]);
    print(appSetting.appTheme.brightness.toString());
  }

  AppSetting getAppSetting() {
    return appSetting;
  }
}
