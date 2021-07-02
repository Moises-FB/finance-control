import 'dart:io';

import 'package:finance_control/models/user.dart';
import 'package:finance_control/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpController with _$SignUpController;

abstract class _SignUpController with Store {
  @observable
  User user = new User();

  @observable
  String password = "";

  @observable
  File? image;

  @observable
  bool visible = false;

  @observable
  bool loading = false;

  @action
  void setName(String value) => user.name = value;

  @action
  void setEmail(String value) => user.email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> loadImage({ImageSource? source, bool remove = false}) async {
    loading = true;
    if (source == null || remove) {
      image = null;
    } else {
      await ImagePicker().getImage(source: source).then((file) {
        if (file != null) {
          image = File(file.path);
        } else {
          image = null;
        }
        setImage(image);
        loading = false;
      });
    }
  }

  @action
  void setImage(File? file) => user.image = image;

  @action
  void toggleVisibility() => visible = !visible;

  @action
  signUp(BuildContext context) async {
    loading = true;
    AuthService service = new AuthService();
    await service.signUp(user, password).then((user) {
      if (user != null) {
        // Globals.sessionController.setUser(user);
        Navigator.of(context).popAndPushNamed('/home');
      }

      user = new User();
      password = "";
      loading = false;
    });
  }

  @computed
  IconData get iconVisibility => visible ? Icons.visibility : Icons.visibility_off;

  @computed
  bool get isValidEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(user.email ?? '');

  @computed
  bool get isValidPass => password.length > 0;

  @computed
  bool get registerPressed => (isValidPass && isValidEmail && !loading);
}
