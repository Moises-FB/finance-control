import 'package:finance_control/controllers/login_controller.dart';
import 'package:finance_control/utils/base_views/base_button.dart';
import 'package:finance_control/utils/base_views/base_text_input.dart';
import 'package:finance_control/utils/base_views/loading.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = new LoginController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    if (await Globals.instance!.sessionController.checkLogged()) {
      Navigator.popAndPushNamed(context, '/home');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.instance!.theme.backgroundColor,
      body: ListView(children: [
        Observer(builder: (_) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: Globals.instance!.windowSize.width * 0.5,
                      height: Globals.instance!.windowSize.width * 0.5,
                      child: Image.asset("assets/images/logo_finance.png")),
                  BaseTextInput(
                    keyboardType: TextInputType.emailAddress,
                    hintText: Globals.instance!.texts.email,
                    prefixIcon: Icons.email,
                    onChanged: controller.setEmail,
                    enabled: !controller.loading,
                  ),
                  BaseTextInput(
                    hintText: Globals.instance!.texts.password,
                    obscureText: !controller.visible,
                    prefixIcon: Icons.vpn_key,
                    suffixIcon: IconButton(
                      icon: Icon(controller.iconVisibility),
                      onPressed: controller.toggleVisibility,
                      color: Colors.grey,
                    ),
                    onChanged: controller.setPassword,
                    enabled: !controller.loading,
                    done: true,
                  ),
                  Container(
                    width: Globals.instance!.windowSize.width,
                    padding: EdgeInsets.only(top: 8, right: 16),
                    child: GestureDetector(
                      child: Text(Globals.instance!.texts.forgotPassword, textAlign: TextAlign.right, style: Globals.instance!.textTheme.caption),
                      onTap: () => Navigator.pushNamed(context, '/esqueceu_senha'),
                    ),
                  ),
                  controller.loading
                      ? Loading()
                      : BaseButton(
                          padding: EdgeInsets.only(top: 24, bottom: 8),
                          label: Globals.instance!.texts.login,
                          onPressed: controller.loginPressed ? () => controller.login(context).then((_) => _formKey.currentState?.reset()) : null),
                  Center(
                    child: GestureDetector(
                      child: Text(Globals.instance!.texts.createAccount, textAlign: TextAlign.center, style: Globals.instance!.textTheme.caption),
                      onTap: () => Navigator.pushNamed(context, '/signUp'),
                    ),
                  )
                ],
              ),
            ),
          );
        })
      ]),
    );
  }
}
