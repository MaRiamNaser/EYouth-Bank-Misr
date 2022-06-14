import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class alertdialog extends StatelessWidget {
  String choice;
  String alertphoto;
  alertdialog(this.choice,this.alertphoto);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      scrollable: true,
      backgroundColor: ColorManager.primary,
      title:  Center(
        child: Text(AppStrings.Well_Done.tr(),
          style: getBoldtStyle(fontSize:18,color: ColorManager.white),),
      ),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(alertphoto,height: 145,width:250, )
            ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 190,
                  child: Center(child: Text(choice=="Goal"?AppStrings.Goal_Has_Been_Added.tr():AppStrings.Task_Has_Been_Added.tr(),  style: getSemiBoldStyle(fontSize:14,color: ColorManager.white),))),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: Container(
            height:30 ,
            width:100 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.darkPrimary,
            ),
            child: TextButton(
              child: Text(AppStrings.Ok.tr(),style:getRegularStyle(color: ColorManager.white) ,),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context,choice==AppStrings.Goal.tr()?Routes.goals: Routes.tasks);
              },
            ),
          ),
        )

      ],
    );
  }
}
