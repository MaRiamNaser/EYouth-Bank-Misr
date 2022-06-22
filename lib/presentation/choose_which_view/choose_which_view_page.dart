import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/presentation/choose_which_view/choose_which_view_widgets.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class WhichViewPage extends StatefulWidget {
  const WhichViewPage({Key? key}) : super(key: key);

  @override
  _WhichViewPageState createState() => _WhichViewPageState();
}

class _WhichViewPageState extends State<WhichViewPage> {
 AppPreferences? _appPreferences;


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorManager.white,
          appBar: AppBar(
        leadingWidth: 120,
        backgroundColor: ColorManager.white,
        actions: [_laguageWidget()],
      
      ),
      body: Center(
        child: Column(

          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
     imageWidget(context),
     SizedBox(height: MediaQuery.of(context).size.height/15,),
     //whoAreYou1Widget(),
     whoAreYou2Widget(),
      SizedBox(height: MediaQuery.of(context).size.height/15,),
     childButton(context),
     parentButton(context),


          ],
          ),
      ),
    );
  }


  _changeLanguage() {
    _appPreferences = AppPreferences();
    _appPreferences?.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  Widget _laguageWidget() {
    return GestureDetector(
      onTap: (() async {
        await _changeLanguage();
      }),
      child: Container(
        margin: EdgeInsets.only(left: AppMargin.m16, right: AppMargin.m16),
        child: Row(
          children: [
            Text(AppStrings.loginLanguage.tr(),
                style: getBoldtStyle(
                  color: ColorManager.black,
                )),
          ],
        ),
      ),
    );
  }

}
