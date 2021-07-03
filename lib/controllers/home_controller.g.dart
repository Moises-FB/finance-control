// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<double>? _$balanceComputed;

  @override
  double get balance =>
      (_$balanceComputed ??= Computed<double>(() => super.balance,
              name: '_HomeController.balance'))
          .value;

  final _$transactionsAtom = Atom(name: '_HomeController.transactions');

  @override
  List<Model.Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<Model.Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$getTransactionsAsyncAction =
      AsyncAction('_HomeController.getTransactions');

  @override
  Future<List<Model.Transaction>?> getTransactions() {
    return _$getTransactionsAsyncAction.run(() => super.getTransactions());
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
balance: ${balance}
    ''';
  }
}
