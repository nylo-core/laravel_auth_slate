String stubRegister() => '''
import '/app/controllers/register_controller.dart';
import '/bootstrap/extensions.dart';
import '/resources/pages/login_page.dart';
import '/resources/widgets/logo_widget.dart';
import '/bootstrap/helpers.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RegisterPage extends NyStatefulWidget<RegisterController> {
  static const path = '/register';

  RegisterPage() : super(path, child: _RegisterPageState());
}

class _RegisterPageState extends NyState<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Container(
          height: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              Logo(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 15
                      )
                    ]
                ),
                child: Column(children: <Widget>[
                  NyTextField(
                    controller: widget.controller.textFieldEmail,
                    labelText: "EMAIL",
                    enableSuggestions: false,
                    autoFocus: true,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    dummyData: "user@gmail.com",
                  ),
                  NyTextField(
                    controller: widget.controller.textFieldPassword,
                    labelText: "PASSWORD",
                    obscureText: true,
                    dummyData: "password",
                    onSubmitted: (String value) {
                      widget.controller.register();
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: ThemeColor.get(context).buttonBackground,
                      child: Text((isLocked('register') ? "Processing" : "Register")).bodyLarge(context).setColor(context, (color) => Colors.white),
                      onPressed: widget.controller.register,
                    ),
                  ),
                ]),
              ),
              InkWell(onTap: () {
                routeTo(LoginPage.path);
              }, child: Text("Already have an account? Login", textAlign: TextAlign.center,),)
            ],
          ),
        ),
      ),
    );
  }
}
''';
