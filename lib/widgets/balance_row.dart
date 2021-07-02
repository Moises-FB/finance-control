import 'package:finance_control/models/category.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/material.dart';

class BalanceRow extends StatelessWidget {
  final Category category;

  BalanceRow({ required this.category });

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Transporte"),
                    Text("- R\$ 100,00", style: TextStyle(color: Colors.red),)
                  ],
                ),

                Spacer(),

                Text("22/06/2021")

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
    switch(category) {
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
