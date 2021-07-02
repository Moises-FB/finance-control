
import 'dart:async';

import 'package:finance_control/models/category.dart';
import 'package:finance_control/models/transaction.dart';
import 'package:finance_control/services/transaction_service.dart';
import 'package:finance_control/utils/date_validator.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'transaction_controller.g.dart';


class TransactionController = _TransactionController with _$TransactionController;

abstract class _TransactionController with Store {
  @observable
  String date = "";

  @action
  void setDate(value) => date = value;

  @observable
  Category? category;

  @action
  void setCategory(value) => category = value;

  @observable
  String value = "";

  @action
  void setValue(value) => this.value = value;

  @observable
  String? emailMessage;

  @observable
  String? passwordMessage;

  @observable
  bool loading = false;

  @observable
  bool success = false;

  @observable
  String errorMessage = "";

  @computed
  bool get savePressed => category != null && value.isNotEmpty && date.isNotEmpty;

  @action
  Future<void> saveTransaction()async {
    loading = true;
    TransactionService transactionService = new TransactionService();
    var parsedValue = value.replaceAllMapped(".", (match) => "");
    parsedValue = parsedValue.replaceAllMapped(",", (match) => ".");
    parsedValue = parsedValue.substring(3);
    var dateObj;
    try{
      var values = date.split("/").map((e) => int.parse(e));
      if (!DateHelper.isValidDateBirth(date, 'dd/MM/yyyy')) {
        throw new Error();
      }
      var convertedTime = new DateFormat('dd/MM/yyyy');
      dateObj = convertedTime.parse(date);

    }catch(error){
      errorMessage = Globals.instance!.texts.dateErrorMessage;
      loading = false;
      return;
    }
    errorMessage = "";
    var doubleValue = double.parse(parsedValue);
    if(category != Category.GAIN){
      doubleValue = doubleValue * -1;
    }
    await transactionService.updateTransaction(Transaction(category: category!, date: dateObj, value: doubleValue, userId: FirebaseAuth.instance.currentUser?.uid));

    loading = false;
    success = true;

  }

}
