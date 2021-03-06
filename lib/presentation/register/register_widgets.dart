import 'package:bank_misr/business_logic/Auth/currentIndexBloc/cubit/currentindex_cubit.dart';
import 'package:bank_misr/business_logic/Auth/signUpBloc/cubit/signup_cubit.dart';
import 'package:bank_misr/presentation/bottomBar/bottomBar.dart';
import 'package:bank_misr/presentation/register/extensions.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

Future<bool> backFunction(int currentIndex, BuildContext context) async {
  if (currentIndex > 0) {
    BlocProvider.of<CurrentindexCubit>(context).decrement();
  } else {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  return false;
}

Widget nameTextFormField(TextEditingController fullNameController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: fullNameController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourName.tr();
        }
        return null;
      },

      decoration: InputDecoration(
        labelText: AppStrings.name.tr(),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
  );
}


Widget emailTextFormField(TextEditingController emailController) {
  return Container(
    margin:const EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: emailController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourEmail.tr();
        }else if(!(val.contains("@") && val.contains(".com"))){
          return "This is not a correct format";
        }/*else if(val.isValidEmail()){
          return "This is not an email format";
        }*/
        return null;
      },

      decoration: InputDecoration(
        labelText: AppStrings.email.tr(),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
  );
}

Widget passwordTextFormField(TextEditingController passwordController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: passwordController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourPassword.tr();
        } else if (val.length < 8) {
          return AppStrings.passwordShouldBeMoreThanEightChars.tr();
        }else if (val.length < 8) {
          return AppStrings.passwordShouldBeMoreThanEightChars.tr();
        }else if(!((val.contains( RegExp(r'[A-Z]') )  || val.contains( RegExp(r'[a-z]')) ) )){
          return "Your password must contain at least one character";
        }else if(!( val.contains( RegExp(r'[0-9]') ))){
          return "Your pssword must contain at least one number";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: AppStrings.password.tr(),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
  );
}

Widget userNameTextFormField(TextEditingController fullNameController) {
  return Container(
    margin:const EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: fullNameController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourUserName.tr();
        }else if(!((val.contains( RegExp(r'[A-Z]') )  || val.contains( RegExp(r'[a-z]')) ) )){
          return "Your user name must have at least one character";
        }else if(!( val.contains( RegExp(r'[0-9]') ))){
          return "Your user name must have at least one number";
        }
       
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.userName.tr(),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
  );
}

Widget ageTextFormField(TextEditingController ageController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: ageController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourAge.tr();
        } else if ((int.parse(val) >= 10 && int.parse(val) <= 15) == false) {
          return AppStrings.pleaseEnterAgeBetween10And15.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.age.tr(),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
  );
}

Widget leadingAppBar() {
  return Container(
      margin: const EdgeInsets.only(left: AppMargin.m12, top: 5),
      child: Image(image: AssetImage(ImageAssets.smallLogo)));
}

Widget appBarTitle() {
  return Text(AppStrings.registerTitle.tr(),
      style: getSemiBoldStyle(color: ColorManager.black));
}

showFlutterToast(String text) async {
  await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorManager.darkGrey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Widget imageWidget(String imagePath, BuildContext context) {
  return Center(
    child: Container(
        width: MediaQuery.of(context).size.width - AppSize.s12,
        height: MediaQuery.of(context).size.height / 2.2,
        child: Image(image: AssetImage(imagePath))),
  );
}

Widget imageLottieWidget(String imagePath, BuildContext context) {
  return Center(
      child: Container(
    width: MediaQuery.of(context).size.width - AppSize.s12,
    height: MediaQuery.of(context).size.height / 2.2,
    child: Lottie.asset(imagePath),
  ));
}

Widget smileWidget(bool visibility, BuildContext context) {
  return Container(
      width: 60,
      height: 60,
      child: Visibility(
          visible: visibility,
          child: imageWidget(ImageAssets.smilePic, context)));
}

Widget circleWidget(String counter) {
  return Container(
    width: 50,
    height: 50,
    child: Center(child: Text(counter)),
    decoration: BoxDecoration(
      // color: ColorManager.green,

      border: Border.all(color: ColorManager.lightPrimary),
      shape: BoxShape.circle,
    ),
  );
}

Widget circlesRow(int currentIndex, BuildContext context) {
  return Row(
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
                  border: Border.all(color: ColorManager.lightPrimary),
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
                  border: Border.all(color: ColorManager.lightPrimary),
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
                  border: Border.all(color: ColorManager.lightPrimary),
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
                  border: Border.all(color: ColorManager.lightPrimary),
                  shape: BoxShape.circle,
                ),
                child: circleWidget("4")),
          ],
        ),
      ),
    ],
  );
}

class ContinueButton extends StatefulWidget {
  var formKey = GlobalKey<FormState>();
  var fullNameController;
  var emailController;
  var ageController;
  var userNameController;
  var passwordController;

  ContinueButton(this.formKey, this.fullNameController, this.emailController,
      this.ageController, this.userNameController, this.passwordController);

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  //int current_index=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentindexCubit, int>(
      builder: (context, current_index) {
        return Container(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width - AppSize.s20,
          margin: EdgeInsets.only(
            left: AppMargin.m20,
            right: AppMargin.m20,
          ),
          //  color: ColorManager.lightGrey,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(ColorManager.grey),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorManager.lightPrimary),
            ),
            onPressed: () async {
              if (current_index <= 4) {
                if (current_index == 0) {
                  if (widget.formKey.currentState!.validate()) {
                    BlocProvider.of<CurrentindexCubit>(context).increment();
                  }
                } else if (current_index == 1) {
                  if (widget.formKey.currentState!.validate()) {
                    bool isEmailExist =
                        await BlocProvider.of<SignUpCubit>(context)
                            .isEmailExist(widget.emailController.text);
                    if (isEmailExist == false) {
                      BlocProvider.of<CurrentindexCubit>(context).increment();
                    } else {
                      showFlutterToast(AppStrings.thisUserIsAlreadyExist.tr());
                    }
                  }
                } else if (current_index == 2) {
                  if (widget.formKey.currentState!.validate()) {
                    BlocProvider.of<CurrentindexCubit>(context).increment();
                  }
                } else if (current_index == 3) {
                  if (widget.formKey.currentState!.validate()) {
                    bool isUserNameExist =
                        await BlocProvider.of<SignUpCubit>(context)
                            .isUserNameExist(widget.userNameController.text);
                    if (isUserNameExist == false) {
                      BlocProvider.of<CurrentindexCubit>(context).increment();
                    } else {
                      await showFlutterToast(
                          AppStrings.thisUserIsAlreadyExist.tr());
                    }
                  }
                } else if (current_index == 4) {
                  if (widget.formKey.currentState!.validate()) {
                    bool result = await BlocProvider.of<SignUpCubit>(context)
                        .signUp(
                            widget.fullNameController.text,
                            widget.userNameController.text,
                            widget.emailController.text,
                            widget.passwordController.text,
                            widget.ageController.text);

                    if (result == true) {
                      showFlutterToast(
                          AppStrings.YouHaveBeenRegistredSuccessfully.tr());
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                      //  currentindex = 0;
                    } else {
                      showFlutterToast(AppStrings
                          .yourPasswordCannotIncludeYourUsername
                          .tr());
                    }
                  }
                }
              }
            },
            child: Text(AppStrings.continueString.tr()),
          ),
        );
      },
    );
  }
}
