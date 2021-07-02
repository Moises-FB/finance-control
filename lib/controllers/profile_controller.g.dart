// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileController, Store {
  final _$tempUserAtom = Atom(name: '_ProfileController.tempUser');

  @override
  User? get tempUser {
    _$tempUserAtom.reportRead();
    return super.tempUser;
  }

  @override
  set tempUser(User? value) {
    _$tempUserAtom.reportWrite(value, super.tempUser, () {
      super.tempUser = value;
    });
  }

  final _$imageAtom = Atom(name: '_ProfileController.image');

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

  final _$loadingAtom = Atom(name: '_ProfileController.loading');

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

  final _$loadImageAsyncAction = AsyncAction('_ProfileController.loadImage');

  @override
  Future<void> loadImage({ImageSource? source, bool remove = false}) {
    return _$loadImageAsyncAction
        .run(() => super.loadImage(source: source, remove: remove));
  }

  final _$updateUserAsyncAction = AsyncAction('_ProfileController.updateUser');

  @override
  Future<void> updateUser(BuildContext context) {
    return _$updateUserAsyncAction.run(() => super.updateUser(context));
  }

  final _$_ProfileControllerActionController =
      ActionController(name: '_ProfileController');

  @override
  void setUser(User? user) {
    final _$actionInfo = _$_ProfileControllerActionController.startAction(
        name: '_ProfileController.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_ProfileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProfileControllerActionController.startAction(
        name: '_ProfileController.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProfileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ProfileControllerActionController.startAction(
        name: '_ProfileController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ProfileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(File? file) {
    final _$actionInfo = _$_ProfileControllerActionController.startAction(
        name: '_ProfileController.setImage');
    try {
      return super.setImage(file);
    } finally {
      _$_ProfileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tempUser: ${tempUser},
image: ${image},
loading: ${loading}
    ''';
  }
}
