// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionController on _SessionControllerBase, Store {
  final _$loggedUserAtom = Atom(name: '_SessionControllerBase.loggedUser');

  @override
  UserModel.User? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(UserModel.User? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$loggedAtom = Atom(name: '_SessionControllerBase.logged');

  @override
  bool get logged {
    _$loggedAtom.reportRead();
    return super.logged;
  }

  @override
  set logged(bool value) {
    _$loggedAtom.reportWrite(value, super.logged, () {
      super.logged = value;
    });
  }

  final _$checkLoggedAsyncAction =
      AsyncAction('_SessionControllerBase.checkLogged');

  @override
  Future<bool> checkLogged() {
    return _$checkLoggedAsyncAction.run(() => super.checkLogged());
  }

  final _$setLoggedAsyncAction =
      AsyncAction('_SessionControllerBase.setLogged');

  @override
  Future setLogged(bool value) {
    return _$setLoggedAsyncAction.run(() => super.setLogged(value));
  }

  final _$logoutAsyncAction = AsyncAction('_SessionControllerBase.logout');

  @override
  Future logout(BuildContext context) {
    return _$logoutAsyncAction.run(() => super.logout(context));
  }

  final _$_SessionControllerBaseActionController =
      ActionController(name: '_SessionControllerBase');

  @override
  dynamic setUser(UserModel.User user) {
    final _$actionInfo = _$_SessionControllerBaseActionController.startAction(
        name: '_SessionControllerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_SessionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
logged: ${logged}
    ''';
  }
}
