import 'package:flutter/material.dart';
import '../../core/enum/viewstate.dart';
import '../../core/viewmodels/login_model.dart';
import '../shared/app_colors.dart';
import '../widgets/login_header.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (BuildContext context, LoginModel model, Widget child) =>
          Scaffold(
        backgroundColor: backgroundColor,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(
                  validationMessage: model.errorMessage,
                  controller: _controller,
                ),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_controller.text);
                          if (loginSuccess) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
