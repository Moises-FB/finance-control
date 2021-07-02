import 'package:finance_control/controllers/transaction_controller.dart';
import 'package:finance_control/models/category.dart';
import 'package:finance_control/utils/base_views/base_button.dart';
import 'package:finance_control/utils/base_views/base_text_input.dart';
import 'package:finance_control/utils/base_views/loading.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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
                  Category.TRANSPORT,
                  Category.LEISURE];
  Size size = Globals.instance!.windowSize;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  late ReactionDisposer disposer ;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => transactionController.success, (_){
      if(transactionController.success){
        final snackBar = SnackBar(content: Text(Globals.instance!.texts.successMessage));
        _formKey.currentState?.reset();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        transactionController.success = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Globals.instance!.texts.addNewPageTitle),),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: size.height*0.02,),

            Observer(builder: (_){
              return BaseTextInput(
                keyboardType: TextInputType.number,
                hintText: Globals.instance!.texts.transactionValueInputText,
                isValue: true,
                onChanged: transactionController.setValue,
              );
            }),
            Row(children: [
              SizedBox(
                width: size.width*0.5,
                child:  Observer(builder: (_){
                  return BaseTextInput(
                    keyboardType: TextInputType.number,
                    hintText: Globals.instance!.texts.transactionDateHint,
                    onChanged: transactionController.setDate,
                    isDate: true,
                  );
                }),),
              Observer(builder: (_){
                return DropdownButton<Category>(
                  value: transactionController.category,
                  hint: Text(Globals.instance!.texts.selectCategoryDropdownHint,),
                  items: listCategories.map((category){
                    return DropdownMenuItem(
                        value: category,
                        child: Text(category.displayTitle));
                  }).toList(),
                  onChanged: transactionController.setCategory,
                );
              }),
            ],),
            Observer(builder: (_){
              if(transactionController.errorMessage.isEmpty)
                return Container();
              else return Text(transactionController.errorMessage, style: TextStyle(color: Colors.red));
            }),
            SizedBox(height: size.height*0.01,),
            transactionController.loading
                ? Loading()
                : BaseButton(
                padding: EdgeInsets.only(top: 24, bottom: 8),
                label: Globals.instance!.texts.save,
                onPressed: transactionController.savePressed ? () => transactionController.saveTransaction() : null),
          ],),
      ),),
    );
  }
  @override
  void dispose() {
    dispose();
    super.dispose();
  }
}
