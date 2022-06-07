import 'package:flutter/cupertino.dart';
import 'package:bank_misr/presentation/home/Widgets/stack_widget.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: AppPadding.p12,top: AppPadding.p8),
        height: 1/825 * screensize.height * 100,
        width: 1/393* screensize.width * 270.83,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(topRight:Radius.circular(AppSize.s20) ,bottomLeft: Radius.circular(AppSize.s20)),
            color: ColorManager.lightPrimary)
        ,
        child: Center(
          child: Column(
            children: [
              Center(child :Text("Welcome Ahmed",style: getMediumStyle(fontSize:16,color: ColorManager.black))),
              SizedBox(height: 1/825 * screensize.height * 4.0,),
              Text("here you can learn how to save Archive  your Goals and add new tasks ",
                style: getMediumStyle(fontSize:16,color: ColorManager.black),),
            ],
          ),
        ),
      ),
    );
  }
}
