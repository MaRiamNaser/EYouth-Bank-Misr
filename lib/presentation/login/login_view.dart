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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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



  @override
  Widget build(BuildContext context) {
    registerationProviderRead = context.read<RegisterationProvider>();
    registerationProviderWatch = context.watch<RegisterationProvider>();
 

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          leadingWidth:120,
          backgroundColor: ColorManager.white,
          
         /* title: Text(
            AppStrings.loginTitle,
            style: getSemiBoldStyle(color: ColorManager.black),
          ),*/
          leading: Container(
            margin: EdgeInsets.only(left: AppMargin.m12, top: 5),
            child: Image(image: AssetImage(ImageAssets.splashLogo))
            )
            ),
            
      /*Image(image: AssetImage(ImageAssets.smallLogo)))*/
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               
              Lottie.asset(
                 ImageAssets.loginLottie),
        
              userNameTextFormField(emailController),
              passwordTextFormField(passwordController),
              forgetPasswordWidget(),
              LoginButton(formKey,emailController,passwordController),
              newToTheAppWidget(context),
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
