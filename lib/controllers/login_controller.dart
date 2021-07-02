import 'package:finance_control/services/auth_service.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool visible = false;

  @observable
  bool loading = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void toggleVisibility() => visible = !visible;

  @action
  login(BuildContext context) async {
    loading = true;

    AuthService service = new AuthService();
    await service.signIn(email, password).then((user) {
      if (user != null) {
        Globals.instance!.sessionController.setUser(user);
        Navigator.of(context).popAndPushNamed('/home');
      }

      email = "";
      password = "";
      loading = false;
    });
  }

  @computed
  bool get isValidEmail => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isValidPass => password.length > 0;

  @computed
  bool get loginPressed => (isValidPass && isValidEmail && !loading);

  @computed
  IconData get iconVisibility =>
      visible ? Icons.visibility : Icons.visibility_off;
}