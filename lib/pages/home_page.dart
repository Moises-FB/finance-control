import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_control/controllers/home_controller.dart';
import 'package:finance_control/controllers/transaction_controller.dart';
import 'package:finance_control/models/transaction.dart' as TransactionModel;
import 'package:finance_control/services/transaction_service.dart';
import 'package:finance_control/utils/base_views/base_drawer.dart';
import 'package:finance_control/utils/base_views/loading.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:finance_control/widgets/balance_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return Scaffold(
        drawer: BaseDrawer(),
        appBar: AppBar(
          title: Text("Finance Control", style: TextStyle(color: Colors.white)),
            centerTitle: true
        ),
        backgroundColor: Globals.instance!.theme.backgroundColor,
        body: Observer(builder: (_){
          return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Globals.instance!.theme.primaryColor,
              child: SizedBox(
                  height: 150,
                  width: Globals.instance!.windowSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Saldo total",
                        style: Globals.instance!.textTheme.headline6!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                        Text(
                          "R\$ ${homeController.balance.toStringAsFixed(2).replaceAll(".", ",")}",
                          style: Globals.instance!.textTheme.headline4!
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        )

                    ],
                  )),
            ),
            RefreshIndicator(
              onRefresh:  homeController.getTransactions,
              child: FutureBuilder(future: homeController.getTransactions(),
              builder: (context, AsyncSnapshot<List<TransactionModel.Transaction>?> snapshot){

                if(snapshot.hasError){
                  print(snapshot.error);
                  return Padding(padding: EdgeInsets.only(top: Globals.instance!.windowSize.height*0.04), child: Center(child: Text(Globals.instance!.texts.transactionsError),));
                }else if(!snapshot.hasData){
                  return Center(child: Loading(),);
                }else {
                  if(snapshot.data == null || snapshot.data!.length == 0){
                    return  Center(child: Text(Globals.instance!.texts.emptyTransactionList),);
                  }else{
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          TransactionModel.Transaction transaction = snapshot.data![index];
                          return BalanceRow(transaction: transaction);
                        });
                  }
                }
              },),
            )

          ],
        );
        }));
  }
}
