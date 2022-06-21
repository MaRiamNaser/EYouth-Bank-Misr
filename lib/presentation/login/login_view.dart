import 'package:bank_misr/presentation/login/login_widgets.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';

import '../../app/app_prefs.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  late AppPreferences _appPreferences;
  @override
  void initState() {
    super.initState();
  }

  _changeLanguage() {
    _appPreferences = AppPreferences();
    _appPreferences.changeAppLanguage();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leadingWidth: 120,
        backgroundColor: ColorManager.white,
        actions: [_laguageWidget()],
        leading: Container(
            margin: EdgeInsets.only(left: AppMargin.m12, top: 5),
            child: Image(image: AssetImage(ImageAssets.splashLogo))),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Lottie.asset(ImageAssets.loginLottie),
              userNameTextFormField(emailController),
              passwordTextFormField(passwordController),
              forgetPasswordWidget(),
              LoginButton(
                    formKey, emailController, passwordController, context),
    
              newToTheAppWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
