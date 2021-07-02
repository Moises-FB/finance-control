
import 'dart:async';

import 'package:mobx/mobx.dart';
part 'transaction_controller.g.dart';

class TransactionController = _TransactionControllereBase with _$TransactionController;

abstract class _TransactionController with Store {
  @observable
  String date = "";

  @action
  void setDate(value) => date = value;

  @observable
  String value = "";

  @action
  void setValue(value) => this.value = value;


  @observable
  String? errorMessage;

  @observable
  String? emailMessage;

  @observable
  String? passwordMessage;

  @observable
  bool loading = false;

  @observable
  bool success = false;

}
