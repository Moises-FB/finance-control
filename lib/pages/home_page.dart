import 'package:finance_control/models/category.dart';
import 'package:finance_control/utils/base_views/base_drawer.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:finance_control/widgets/balance_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: BaseDrawer(),
        appBar: AppBar(
          title: Text("Finance Control", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Globals.instance!.theme.backgroundColor,
        body: Column(
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
                        "R\$ 200,00",
                        style: Globals.instance!.textTheme.headline4!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return BalanceRow(category: Category.TRANSPORT);
                })
          ],
        ));
  }
}
