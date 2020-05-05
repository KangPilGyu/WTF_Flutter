import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      child: new MaterialAppWithSetting(),
    );
  }
}

class MaterialAppWithSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSettingModel = Provider.of<AppSettingModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Proj',
      theme: appSettingModel.getAppSetting().appTheme,
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
