import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider Architecture',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        initialRoute: '/login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
