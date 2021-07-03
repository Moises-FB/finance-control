import 'package:finance_control/models/category.dart';
import 'package:finance_control/models/transaction.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceRow extends StatelessWidget {
  final Transaction transaction;

  BalanceRow({ required this.transaction });

  @override
  Widget build(BuildContext context) {
    var dateFormatter = new DateFormat('dd/MM/yyyy');
    var date = dateFormatter.format(transaction.date);

    var value = 'R\$ ${transaction.value.toStringAsFixed(2).replaceAll(".", ",")}';
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  width: 35,
                  child: getCategoryImage(),
                ),

                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(transaction.category.displayTitle),
                    Text(value, style: TextStyle(color: transaction.value > 0 ? Colors.green : Colors.red),)
                  ],
                ),

                Spacer(),

                Text(date)

              ],
            ),
            Spacer(),
            Divider(color: Globals.instance!.theme.dividerColor)
          ],
        ),
      ),
    );
  }

  Image getCategoryImage() {
    switch(transaction.category) {
      case Category.BILLS:
        return Image.asset("assets/categories/bills_icon.png");
      case Category.FOOD:
        return Image.asset("assets/categories/food_icon.png");
      case Category.GAIN:
        return Image.asset("assets/categories/gain_icon.png");
      case Category.LEISURE:
        return Image.asset("assets/categories/leisure_icon.png");
      case Category.TRANSPORT:
        return Image.asset("assets/categories/transport_icon.png");
    }
  }
}
