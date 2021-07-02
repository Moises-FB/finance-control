import 'package:finance_control/models/user.dart' as UserModel;
import 'package:finance_control/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'session_controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {

  @observable
  UserModel.User? loggedUser;

  @observable
  bool logged = false;

  @action
  setUser(UserModel.User user) {
    loggedUser = user;
    setLogged(true);
  }

  @action
  Future<bool> checkLogged() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogged = pref.getBool("logged") ?? false;

    if(isLogged) {
      AuthService authService = AuthService();
      loggedUser = await authService.loadUserData();
    }

    return isLogged;
  }

  @action
  setLogged(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("logged", value);
    logged = value;
  }

  @action
  logout(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    setLogged(false);
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}