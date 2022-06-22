  import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageWidget(BuildContext context){

    return  Image(image: AssetImage(ImageAssets.splashLogo),
            width: MediaQuery.of(context).size.width - 50,
            height: 100,);
  }

  Widget childButton(BuildContext context){
    return             Container(
         height: 50.0,
         margin: EdgeInsets.all(10),
         child: RaisedButton(
         onPressed: () {

            Navigator.pushNamed(context, Routes.loginRoute);
         },
         shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(80.0)),
         padding: EdgeInsets.all(0.0),
         child: Ink(
           decoration: BoxDecoration(
             color: ColorManager.primary,
          
           borderRadius: BorderRadius.circular(30.0)),
           child: Container(
         constraints:
             BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
         alignment: Alignment.center,
         child: Text(
           AppStrings.child.tr(),
           textAlign: TextAlign.center,
           style: TextStyle(color: Colors.white, fontSize: 15),
         ),
           ),
         ),
         ),
         );
  }

  Widget parentButton(BuildContext context){
    return Container(
         height: 50.0,
         margin: EdgeInsets.all(10),
         child: RaisedButton(
         onPressed: () {
              Navigator.pushNamed(context, Routes.parentSignInRoute);
         },
         shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(80.0)),
         padding: EdgeInsets.all(0.0),
         child: Ink(
           decoration: BoxDecoration(
      color: ColorManager.primary,
           borderRadius: BorderRadius.circular(30.0)),
           child: Container(
         constraints:
             BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
         alignment: Alignment.center,
         child: Text(
           AppStrings.parent.tr(),
           textAlign: TextAlign.center,
           style: TextStyle(color: Colors.white, fontSize: 15),
         ),
           ),
         ),
         ),
         );
  }

  Widget whoAreYou1Widget(){
  return  Row(
                   // mainAxisAlignment: MainAxisAlignment.start,
                     children: [                      
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: AppMargin.m20),
                            child: Text(
                                "Could you Please tell us,",
                                 style: getBoldtStyle(color: ColorManager.black,fontSize: AppSize.s30),
                                  textAlign: TextAlign.justify
                              ),
                          ),
                        ),
                       
                     ],
                   );
}
  Widget whoAreYou2Widget(){
  return  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [                      
                        Container(
                          margin: EdgeInsets.only(left: AppMargin.m20),
                          child: Text(
                              " who are you?",
                               style: getBoldtStyle(color: ColorManager.black,fontSize: AppSize.s30),
                                textAlign: TextAlign.justify
                            ),
                        ),
                       
                     ],
                   );
}