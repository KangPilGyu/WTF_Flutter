import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wtf_main/app_localizations.dart';
import 'package:wtf_main/core/viewmodels/app_setting_model.dart';
import 'core/models/user.dart';
import 'core/services/authentication_service.dart';
import 'locator.dart';
import 'ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(initialData: User.initial(), value: locator<AuthenticationService>().userController.stream),
        ChangeNotifierProvider<AppSettingModel>(
          create: (context) => locator<AppSettingModel>()
        )
      ],
      child: new MaterialAppWithCustom(),
    );
  }
}

class MaterialAppWithCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSettingModel = Provider.of<AppSettingModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Proj',
      theme: appSettingModel.getAppSetting().appTheme,
      supportedLocales: [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          print('${supportedLocale.languageCode} ${supportedLocale.countryCode}');
          print('${locale.languageCode} ${locale.countryCode}');
          if (supportedLocale.languageCode == locale.languageCode
              && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
