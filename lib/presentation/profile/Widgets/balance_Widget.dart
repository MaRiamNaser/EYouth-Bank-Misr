import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
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
      height:1/825 * screensize.height * 150,
      width:1/825 * screensize.height * 150,
      decoration: BoxDecoration(
           shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            )
          ]

        //   borderRadius: BorderRadius.circular(80)
       ),
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
                    AppStrings.EGP.tr(),
                    style: getBoldtStyle(
                        fontSize: 20,
                        color: ColorManager.primary),
                  ),
                ],
              )),
    );
  }
}
