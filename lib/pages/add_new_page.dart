import 'package:finance_control/controllers/transaction_controller.dart';
import 'package:finance_control/models/category.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  TransactionController transactionController = TransactionController();
  List<Category> listCategories = [Category.BILLS,
                  Category.FOOD,
                  Category.GAIN,
                  Category.TRANSPORT];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Globals.instance!.texts.addNewPageTitle),),
      body: Column(children: [
        
        Observer(builder: (_){
          
          return DropdownButton<Category>(
            hint: Text(Globals.instance!.texts.selectCategoryDropdownHint,),
            items: listCategories.map((category){
              return DropdownMenuItem(
                  value: category,
                  child: Text(category.toString()));
            }).toList()
          );
        }),
        
        Observer(builder: (_){
          return TextFormField(
            decoration: InputDecoration(
              hintText: Globals.instance!.texts.transactionValueInputText
            ),
            onChanged: transactionController.setValue,
          );
        })
      ],),
    );
  }
}
