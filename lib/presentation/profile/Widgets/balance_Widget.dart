import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
class BalanceWidget extends StatelessWidget {
  int balance;
  BalanceWidget(this.balance);

  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(80)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height:  125,
          width:  125,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80)),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    balance.toString(),
                    style: getBoldtStyle(
                        fontSize: 40,
                        color: ColorManager.primary),
                  ),
                  Text(
                    "EGP",
                    style: getBoldtStyle(
                        fontSize: 20,
                        color: ColorManager.primary),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
