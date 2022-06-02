import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/constants_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class RegisterNameView extends StatefulWidget {
  const RegisterNameView({Key? key}) : super(key: key);

  @override
  State<RegisterNameView> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterNameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leadingWidth: AppConstants.leadingWidth,
          title: Text(
            AppStrings.registerTitle,
            style: getSemiBoldStyle(
                color: ColorManager.black),
          ),
          leading: Icon(Icons.arrow_back, color: ColorManager.black,)),/*Image(image: AssetImage(ImageAssets.smallLogo)))*/
      body: Center(
          child: Container(
              child: Text(
        "Register Name!",
      ))),
    );
  }
}
