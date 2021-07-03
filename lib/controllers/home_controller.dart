import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_control/services/transaction_service.dart';
import 'package:finance_control/models/transaction.dart' as Model;
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  // @observable
  // double balance = 0.0;

  @observable
  List<Model.Transaction> transactions = [];

  @computed
  double get balance => transactions.fold(0.0, (value, element) => value + element.value);

  @action
  Future<List<Model.Transaction>?> getTransactions() async{
    transactions = await TransactionService().getTransactions() ?? [];
    return transactions;
  }
}