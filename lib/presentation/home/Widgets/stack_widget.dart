import 'package:flutter/cupertino.dart';

import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 1/825 * screensize.height * 200 ,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(AppSize.s18),bottomLeft:Radius.circular(AppSize.s18))
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ahmed Mohamed",style: getSemiBoldStyle(fontSize:25,color: ColorManager.white),)
                ,
                SizedBox(height: 1/825 * screensize.height * 12,),
                Text("Balance",style: getMediumStyle(fontSize: 21,color: ColorManager.white))
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left:130,top: 150),
          child: Container(
            height: 1/825 * screensize.height * 140 ,
            width: 1/393* screensize.width *140 ,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color:Colors.grey),
                borderRadius: BorderRadius.circular(80)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 1/825 * screensize.height * 125 ,
                width: 1/393* screensize.width *125 ,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(80)
                ),
                child: Center(
                    child :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("0",style: getBoldtStyle(fontSize:40,color: ColorManager.primary),),
                        Text("EGP",style: getBoldtStyle(fontSize: 20,color: ColorManager.primary),),

                      ],
                    )
                ),

              ),
            ),

          ),
        ),
      ],
    );
  }
}
