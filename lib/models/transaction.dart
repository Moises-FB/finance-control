import 'package:cloud_firestore/cloud_firestore.dart' as f;

import 'category.dart';

class Transaction{
  String? userId;
  Category category;
  DateTime date;
  double value;

  Transaction({required this.category, required this.date, required this.value, this.userId});

  static Transaction fromJson(f.DocumentSnapshot<Object?> snapshot){
    late Category newCategory;
    switch((snapshot.data()! as Map<String, Object?>)["category"]){
      case "bills": newCategory = Category.BILLS; break;
      case "food": newCategory = Category.FOOD; break;
      case "gain": newCategory = Category.GAIN; break;
      case "leisure": newCategory = Category.LEISURE; break;
      default: newCategory = Category.TRANSPORT; break;
    }

    return Transaction(
      category: newCategory,
      date: (snapshot.data()! as Map<String, DateTime>)["date"]!,
      value: (snapshot.data()! as Map<String, double>)["value"]!,
      userId: (snapshot.data()! as Map<String, String>)["userId"]!
    );
  }
  Map<String, dynamic> toJson(){
    return {
      "userId": userId,
    "date" :  date,
    "value" : value,
    "category" :  category.displayTitle,
    };
  }
}