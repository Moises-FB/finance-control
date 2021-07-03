
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:finance_control/controllers/session_controller.dart';
import 'package:finance_control/models/transaction.dart' as My;
import 'package:finance_control/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionService{
  final firestore.CollectionReference _transactiosRef = firestore.FirebaseFirestore.instance
      .collection('transactions')
      .withConverter<My.Transaction>(
      fromFirestore: (snapshot, _) => My.Transaction.fromJson(snapshot),
      toFirestore: (transaction, _) => transaction.toJson()
  );

  Future<void> updateTransaction(My.Transaction transacion) async {

    try {
      SessionController sessionController = Globals.instance!.sessionController;

      if (sessionController.loggedUser?.uid == null) return null;
      await _transactiosRef.add(transacion);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<My.Transaction>?> getTransactions() async{
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return null;
    firestore.QuerySnapshot<Object?> response = await _transactiosRef.where("userId", isEqualTo: userId).orderBy("date", descending: true).get();
    var transactions = response.docs.map((e) => e.data() as My.Transaction).toList();
    return  transactions;
  }
}