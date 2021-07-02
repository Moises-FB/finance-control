// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpController, Store {
  Computed<IconData>? _$iconVisibilityComputed;

  @override
  IconData get iconVisibility => (_$iconVisibilityComputed ??=
          Computed<IconData>(() => super.iconVisibility,
              name: '_SignUpController.iconVisibility'))
      .value;
  Computed<bool>? _$isValidEmailComputed;

  @override
  bool get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<bool>(() => super.isValidEmail,
              name: '_SignUpController.isValidEmail'))
          .value;
  Computed<bool>? _$isValidPassComputed;

  @override
  bool get isValidPass =>
      (_$isValidPassComputed ??= Computed<bool>(() => super.isValidPass,
              name: '_SignUpController.isValidPass'))
          .value;
  Computed<bool>? _$registerPressedComputed;

  @override
  bool get registerPressed =>
      (_$registerPressedComputed ??= Computed<bool>(() => super.registerPressed,
              name: '_SignUpController.registerPressed'))
          .value;

  final _$userAtom = Atom(name: '_SignUpController.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpController.password');

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

  final _$imageAtom = Atom(name: '_SignUpController.image');

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$visibleAtom = Atom(name: '_SignUpController.visible');

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

  final _$loadingAtom = Atom(name: '_SignUpController.loading');

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

  final _$loadImageAsyncAction = AsyncAction('_SignUpController.loadImage');

  @override
  Future<void> loadImage({ImageSource? source, bool remove = false}) {
    return _$loadImageAsyncAction
        .run(() => super.loadImage(source: source, remove: remove));
  }

  final _$signUpAsyncAction = AsyncAction('_SignUpController.signUp');

  @override
  Future signUp(BuildContext context) {
    return _$signUpAsyncAction.run(() => super.signUp(context));
  }

  final _$_SignUpControllerActionController =
      ActionController(name: '_SignUpController');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(File? file) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setImage');
    try {
      return super.setImage(file);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibility() {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
image: ${image},
visible: ${visible},
loading: ${loading},
iconVisibility: ${iconVisibility},
isValidEmail: ${isValidEmail},
isValidPass: ${isValidPass},
registerPressed: ${registerPressed}
    ''';
  }
}
