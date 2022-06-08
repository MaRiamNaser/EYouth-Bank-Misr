import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/register/register_widgets.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/constants_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterView> {
  RegisterationProvider? registerationProviderRead;
  RegisterationProvider? registerationProviderWatch;

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Widget currentTextFormField() {
    if (registerationProviderWatch!.index == 0) {
      return nameTextFormField(fullNameController);
    } else if (registerationProviderWatch!.index == 1) {
      return emailTextFormField(emailController);
    } else if (registerationProviderWatch!.index == 2) {
      return ageTextFormField(ageController);
    } else if (registerationProviderWatch!.index == 3) {
      return userNameTextFormField(userNameController);
    } else if (registerationProviderWatch!.index == 4) {
      return passwordTextFormField(passwordController);
    } else {
      return passwordTextFormField(passwordController);
    }
  }

  Widget currentImage() {
    if (registerationProviderWatch!.index == 0) {
      return imageLottieWidget(ImageAssets.nameLottie, context);
      /*imageWidget(ImageAssets.welcomePic, context)*/;
    } else if (registerationProviderWatch!.index == 1) {
      return imageLottieWidget(ImageAssets.emailLottie, context);
    } else if (registerationProviderWatch!.index == 2) {
      return imageLottieWidget(ImageAssets.ageLottie, context);
    } else if (registerationProviderWatch!.index == 3) {
      return imageLottieWidget(ImageAssets.userNameLottie, context);
    } else if (registerationProviderWatch!.index == 4) {
      return imageLottieWidget(ImageAssets.passwordLottie, context);
    } else {
      return imageWidget(ImageAssets.welcomePic, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    registerationProviderRead = context.read<RegisterationProvider>();
    registerationProviderWatch = context.watch<RegisterationProvider>();

    return WillPopScope(
      onWillPop: () async {
        if (registerationProviderWatch!.index > 0) {
          registerationProviderRead!.decreaseIndex();
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        }

        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
            leadingWidth: 70,
            title: Text(
              AppStrings.registerTitle,
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
            leading: Icon(
              Icons.arrow_back,
              color: ColorManager.black,
            )),
        /*Image(image: AssetImage(ImageAssets.smallLogo)))*/
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                currentTextFormField(),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                currentImage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: AppMargin.m18),
                      child: Column(
                        children: [
                          smileWidget(
                              registerationProviderWatch!.index >= 1
                                  ? true
                                  : false,
                              context),
                          Container(
                              decoration: BoxDecoration(
                                color: registerationProviderWatch!.index >= 1
                                    ? ColorManager.green
                                    : ColorManager.lightGrey,
                                border: Border.all(
                                    color: ColorManager.lightPrimary),
                                shape: BoxShape.circle,
                              ),
                              child: circleWidget("1")),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppMargin.m18),
                      child: Column(
                        children: [
                          smileWidget(
                              registerationProviderWatch!.index >= 2
                                  ? true
                                  : false,
                              context),
                          Container(
                              decoration: BoxDecoration(
                                color: registerationProviderWatch!.index >= 2
                                    ? ColorManager.green
                                    : ColorManager.lightGrey,
                                border: Border.all(
                                    color: ColorManager.lightPrimary),
                                shape: BoxShape.circle,
                              ),
                              child: circleWidget("2")),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppMargin.m18),
                      child: Column(
                        children: [
                          smileWidget(
                              registerationProviderWatch!.index >= 3
                                  ? true
                                  : false,
                              context),
                          Container(
                              decoration: BoxDecoration(
                                color: registerationProviderWatch!.index >= 3
                                    ? ColorManager.green
                                    : ColorManager.lightGrey,
                                border: Border.all(
                                    color: ColorManager.lightPrimary),
                                shape: BoxShape.circle,
                              ),
                              child: circleWidget("3")),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppMargin.m18),
                      child: Column(
                        children: [
                          smileWidget(
                              registerationProviderWatch!.index >= 4
                                  ? true
                                  : false,
                              context),
                          Container(
                              decoration: BoxDecoration(
                                color: registerationProviderWatch!.index >= 4
                                    ? ColorManager.green
                                    : ColorManager.lightGrey,
                                border: Border.all(
                                    color: ColorManager.lightPrimary),
                                shape: BoxShape.circle,
                              ),
                              child: circleWidget("4")),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s12),
                ContinueButton(formKey, fullNameController, emailController,
                    ageController, userNameController, passwordController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
