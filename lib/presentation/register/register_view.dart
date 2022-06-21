import 'package:bank_misr/business_logic/Auth/currentIndexBloc/cubit/currentindex_cubit.dart';
import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/register/register_widgets.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/constants_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterView> {

  final formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  Widget currentTextFormField(int index) {
    if (index == 0) {
      return nameTextFormField(fullNameController);
    } else if (index == 1) {
      return emailTextFormField(emailController);
    } else if (index == 2) {
      return ageTextFormField(ageController);
    } else if (index == 3) {
      return userNameTextFormField(userNameController);
    } else if (index == 4) {
      return passwordTextFormField(passwordController);
    } else {
      return passwordTextFormField(passwordController);
    }
  }

  Widget currentImage(int index) {
    if (index == 0) {
      return imageLottieWidget(ImageAssets.nameLottie, context);
      /*imageWidget(ImageAssets.welcomePic, context)*/;
    } else if (index == 1) {
      return imageLottieWidget(ImageAssets.emailLottie, context);
    } else if (index == 2) {
      return imageLottieWidget(ImageAssets.ageLottie, context);
    } else if (index == 3) {
      return imageLottieWidget(ImageAssets.userNameLottie, context);
    } else if (index == 4) {
      return imageLottieWidget(ImageAssets.passwordLottie, context);
    } else {
      return imageWidget(ImageAssets.welcomePic, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentindexCubit, int>(
      builder: (context, currentIndex) {

        return WillPopScope(
          onWillPop: () async {
            if (currentIndex > 0) {
              BlocProvider.of<CurrentindexCubit>(context).decrement();
            } else {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            }
    
            return false;
          },
          child: Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
                leadingWidth: 120,
                backgroundColor: ColorManager.white,
                title: Text(
                  AppStrings.registerTitle.tr(),
                  style: getSemiBoldStyle(color: ColorManager.black),
                ),
                leading: Container(
                    margin: EdgeInsets.only(left: AppMargin.m12, top: 5),
                    child: Image(image: AssetImage(ImageAssets.smallLogo)))),
            /*Image(image: AssetImage(ImageAssets.smallLogo)))*/
            body: BlocBuilder<CurrentindexCubit, int>(
              builder: (context, currentIndex) {
                    return SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 20),
                        currentTextFormField(currentIndex),
                        SizedBox(height: MediaQuery.of(context).size.height / 20),
                        currentImage(currentIndex),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: AppMargin.m18),
                              child: Column(
                                children: [
                                  smileWidget(currentIndex >= 1 ? true : false, context),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: currentIndex >= 1
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
                                  smileWidget(currentIndex >= 2 ? true : false, context),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: currentIndex >= 2
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
                                  smileWidget(currentIndex >= 3 ? true : false, context),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: currentIndex >= 3
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
                                  smileWidget(currentIndex >= 4 ? true : false, context),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: currentIndex >= 4
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
                        ContinueButton(
                            formKey,
                            fullNameController,
                            emailController,
                            ageController,
                            userNameController,
                            passwordController,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ));
      },
  
    );
  }
}
