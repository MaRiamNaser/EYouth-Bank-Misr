import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/login/login_widgets.dart';
import 'package:bank_misr/presentation/register/register_view.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/constants_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:bank_misr/presentation/setting/setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../app/app_prefs.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<LoginView> {
  RegisterationProvider? registerationProviderRead;
  RegisterationProvider? registerationProviderWatch;
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  late AppPreferences _appPreferences;

  _changeLanguage() {
    _appPreferences = AppPreferences();
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  Widget _laguageWidget() {
    return GestureDetector(
      onTap: (()async {
       await _changeLanguage();
      }),
      child: Container(
        margin: EdgeInsets.only(left: AppMargin.m16, right: AppMargin.m16),
        child: Row(
          children: [
          Text(AppStrings.loginLanguage.tr(), style: getBoldtStyle(color: ColorManager.black,)),
    
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    registerationProviderRead = context.read<RegisterationProvider>();
    registerationProviderWatch = context.watch<RegisterationProvider>();

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

      /*Image(image: AssetImage(ImageAssets.smallLogo)))*/
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
              LoginButton(formKey, emailController, passwordController),
              newToTheAppWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
