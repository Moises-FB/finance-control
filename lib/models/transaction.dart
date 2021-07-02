import 'dart:ffi';
import 'category.dart';

class Transaction{
  Category category;
  String date;
  Double value;

  Transaction({required this.category, required this.date, required this.value});

  Transaction fromJson(Map<String, dynamic> data){
    late Category newCategory;
    switch(data["category"]){
      case "bills": newCategory = Category.BILLS; break;
      case "food": newCategory = Category.FOOD; break;
      case "gain": newCategory = Category.GAIN; break;
      default: newCategory = Category.TRANSPORT; break;
    }

    return Transaction(
      category: newCategory,
      date: data["date"],
      value: data["value"]

    );
  }
  Map<String, dynamic> toJson(Transaction data){
    Map<String, dynamic> newMap = {};
    newMap["date"] = data.date;
    newMap["value"] = data.value;
    newMap["category"] = data.category;

    return newMap;
  }
}