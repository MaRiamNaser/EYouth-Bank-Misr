import 'package:bank_misr/business_logic/Auth/signInBloc/cubit/signin1_cubit.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../home/parentHomeView/parentHomeView.dart';

Widget passwordTextFormField(TextEditingController passwordController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.pleaseEnterYourPassword.tr();
        }
        return null;
      },
      obscureText: true,
      controller: passwordController,
      // keyboardType: TextInputType.phone,
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

Widget userNameTextFormField(TextEditingController userNameController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.pleaseEnterYourUserName.tr();
        }
        return null;
      },

      controller: userNameController,

      // keyboardType: TextInputType.phone,
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

class SignInButton extends StatelessWidget {
  final formKey;
  final emailController;
  final passwordController;
  final context2;
  SignInButton(this.formKey, this.emailController, this.passwordController,
      this.context2);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => blocGenerator().signInCubit,
      child: BlocBuilder<Signin1Cubit, Signin1State>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width - AppSize.s20,
            margin: const EdgeInsets.only(
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
                if (formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParentHomeView()));
                  // await BlocProvider.of<Signin1Cubit>(context).signIn(emailController.text, passwordController.text);
                  //  if (state is UserSignedIn) {
                  //    showFlutterToast(
                  //    AppStrings.youAreLoggedInSuccessfully.tr());
                  //    Navigator.pushReplacementNamed(context, Routes.homeLayout);
                  //  } else {
                  //    showFlutterToast(
                  //        AppStrings.yourEmailOrPasswordMayBeWrong.tr());
                  //  }
                }
              },
              child: Text(AppStrings.loginTitle.tr()),
            ),
          );
        },
      ),
    );
    ;
  }
}

showFlutterToast(String text) async {
  await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorManager.primary,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Widget forgetPasswordWidget() {
  return Container(
    margin: EdgeInsets.only(
        right: AppMargin.m20,
        top: AppMargin.m20,
        bottom: AppMargin.m20,
        left: AppMargin.m20),
    child: Text(
      AppStrings.forgetPassword.tr(),
      style: getRegularStyle(color: ColorManager.grey),
    ),
  );
}

Widget newToTheAppWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
        right: AppMargin.m20,
        top: AppMargin.m20,
        bottom: AppMargin.m20,
        left: AppMargin.m20),
    //child: Text('Don\'t have an account? Create'),
    child: Text.rich(TextSpan(children: [
      TextSpan(
          text: AppStrings.newToTheApp.tr(),
          style: getRegularStyle(
            color: ColorManager.black,
          )),
      TextSpan(
          text: AppStrings.registerTitle.tr(),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacementNamed(context, Routes.parentSignUpRoute);
            },
          style: getBoldtStyle(
            color: ColorManager.red,
          )),
    ])),
  );
}

Widget helloWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: AppMargin.m20),
        child: Text("Hello,",
            style:
                getBoldtStyle(color: ColorManager.black, fontSize: AppSize.s40),
            textAlign: TextAlign.justify),
      ),
    ],
  );
}

Widget welcomeBackWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: AppMargin.m20),
        child: Text("Welcome back",
            style: getBoldtStyle(
                color: ColorManager.primary, fontSize: AppSize.s40),
            textAlign: TextAlign.justify),
      ),
    ],
  );
}
