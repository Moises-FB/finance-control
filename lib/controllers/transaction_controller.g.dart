// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionController on _TransactionController, Store {
  Computed<bool>? _$savePressedComputed;

  @override
  bool get savePressed =>
      (_$savePressedComputed ??= Computed<bool>(() => super.savePressed,
              name: '_TransactionController.savePressed'))
          .value;

  final _$dateAtom = Atom(name: '_TransactionController.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$categoryAtom = Atom(name: '_TransactionController.category');

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$valueAtom = Atom(name: '_TransactionController.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$emailMessageAtom = Atom(name: '_TransactionController.emailMessage');

  @override
  String? get emailMessage {
    _$emailMessageAtom.reportRead();
    return super.emailMessage;
  }

  @override
  set emailMessage(String? value) {
    _$emailMessageAtom.reportWrite(value, super.emailMessage, () {
      super.emailMessage = value;
    });
  }

  final _$passwordMessageAtom =
      Atom(name: '_TransactionController.passwordMessage');

  @override
  String? get passwordMessage {
    _$passwordMessageAtom.reportRead();
    return super.passwordMessage;
  }

  @override
  set passwordMessage(String? value) {
    _$passwordMessageAtom.reportWrite(value, super.passwordMessage, () {
      super.passwordMessage = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TransactionController.loading');

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

  final _$successAtom = Atom(name: '_TransactionController.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_TransactionController.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$saveTransactionAsyncAction =
      AsyncAction('_TransactionController.saveTransaction');

  @override
  Future<void> saveTransaction() {
    return _$saveTransactionAsyncAction.run(() => super.saveTransaction());
  }

  final _$_TransactionControllerActionController =
      ActionController(name: '_TransactionController');

  @override
  void setDate(dynamic value) {
    final _$actionInfo = _$_TransactionControllerActionController.startAction(
        name: '_TransactionController.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_TransactionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(dynamic value) {
    final _$actionInfo = _$_TransactionControllerActionController.startAction(
        name: '_TransactionController.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_TransactionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(dynamic value) {
    final _$actionInfo = _$_TransactionControllerActionController.startAction(
        name: '_TransactionController.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$_TransactionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
category: ${category},
value: ${value},
emailMessage: ${emailMessage},
passwordMessage: ${passwordMessage},
loading: ${loading},
success: ${success},
errorMessage: ${errorMessage},
savePressed: ${savePressed}
    ''';
  }
}
