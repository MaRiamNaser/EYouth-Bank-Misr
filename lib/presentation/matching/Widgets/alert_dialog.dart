import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../home/home_view.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class AlertDialogLesson extends StatelessWidget {
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
            Lottie.asset(ImageAssets.alertComplete,height: 145,width:250, )
            ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 190,
                  child: Center(child: Text("Congratulations You Have Passed The Lesson !!\n Go to the Next One !"
                    ,  style: getSemiBoldStyle(fontSize:14,color: ColorManager.white),))),
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
                Navigator.of(context).pop();
              },
            ),
          ),
        )

      ],
    );
  }
}
