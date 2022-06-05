import 'package:flutter/cupertino.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Container(
      height: 1/825 * screensize.height * 140,
      width: 1/393* screensize.width * 140,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(80)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 1/825 * screensize.height * 125,
          width: 1/393* screensize.width * 125,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(80)),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
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
