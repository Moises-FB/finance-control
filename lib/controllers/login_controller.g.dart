// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<bool>? _$isValidEmailComputed;

  @override
  bool get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<bool>(() => super.isValidEmail,
              name: '_LoginController.isValidEmail'))
          .value;
  Computed<bool>? _$isValidPassComputed;

  @override
  bool get isValidPass =>
      (_$isValidPassComputed ??= Computed<bool>(() => super.isValidPass,
              name: '_LoginController.isValidPass'))
          .value;
  Computed<bool>? _$loginPressedComputed;

  @override
  bool get loginPressed =>
      (_$loginPressedComputed ??= Computed<bool>(() => super.loginPressed,
              name: '_LoginController.loginPressed'))
          .value;
  Computed<IconData>? _$iconVisibilityComputed;

  @override
  IconData get iconVisibility => (_$iconVisibilityComputed ??=
          Computed<IconData>(() => super.iconVisibility,
              name: '_LoginController.iconVisibility'))
      .value;

  final _$emailAtom = Atom(name: '_LoginController.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$visibleAtom = Atom(name: '_LoginController.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginController.login');

  @override
  Future login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibility() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
visible: ${visible},
loading: ${loading},
isValidEmail: ${isValidEmail},
isValidPass: ${isValidPass},
loginPressed: ${loginPressed},
iconVisibility: ${iconVisibility}
    ''';
  }
}
