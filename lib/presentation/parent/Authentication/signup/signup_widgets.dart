import 'package:bank_misr/business_logic/Auth/signInBloc/cubit/signin1_cubit.dart';
import 'package:bank_misr/business_logic/Auth/signUpBloc/cubit/signup_cubit.dart';
import 'package:bank_misr/presentation/home/parentHomeView/parentHomeView.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget passwordTextFormField(TextEditingController Controller) {
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
      controller: Controller,
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

Widget userNameTextFormField(TextEditingController Controller,title) {
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

      controller: Controller,

      // keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: title,
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

class SignUpButton extends StatefulWidget {
  final formKey;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController usernameController;
  TextEditingController fullnameController;
  final context2;
  SignUpButton(this.formKey, this.usernameController, this.passwordController,this.fullnameController, this.emailController, this.context2);

  @override
  _SignUpButtonState createState() => _SignUpButtonState(formKey, usernameController, passwordController,fullnameController, emailController, context2);
}

class _SignUpButtonState extends State<SignUpButton> {
  final formKey;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController usernameController;
  TextEditingController fullnameController;
  final context2;

  _SignUpButtonState(this.formKey, this.usernameController,this.passwordController, this.fullnameController, this.emailController, this.context2);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => blocGenerator().signUpCubit,
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width - AppSize.s20,
            margin: const EdgeInsets.only(
              left: AppMargin.m20,
              right: AppMargin.m20,
            ),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColorManager.grey),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorManager.lightPrimary),
              ),
              onPressed: () async {
                setState(() {

                });
                if (formKey.currentState!.validate()) {
                  String message=await BlocProvider.of<SignUpCubit>(context)
                      .signUp(fullnameController.text, usernameController.text, emailController.text, passwordController.text, "");
                  if (message=="True") {
                    showFlutterToast(
                        AppStrings.youAreLoggedInSuccessfully.tr());
                    Navigator.pushReplacementNamed(context, Routes.parentSignInRoute);
                  } else {
                    showFlutterToast(
                        message);
                  }
                }
              },
              child: Text(AppStrings.registerTitle.tr()),
            ),
          );
        },
      ),
    );
  }
}

showFlutterToast(String text) async {
  await Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
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

Widget appDescription() {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Text(
        AppStrings.This_app_you_can_add.tr(),
        style: getLightStyle(color: ColorManager.grey),
        textAlign: TextAlign.justify),
  );
}

Widget letsGetToKnowYouWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: AppMargin.m20),
          child: Text(AppStrings.Lets_get_to_know_you.tr(),
              style: getBoldtStyle(
                  color: ColorManager.primary, fontSize: AppSize.s30),
              textAlign: TextAlign.justify),
        ),
      ),
    ],
  );
}

Widget helloWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: AppMargin.m20),
        child: Text(AppStrings.Hello.tr(),
            style:
                getBoldtStyle(color: ColorManager.black, fontSize: AppSize.s40),
            textAlign: TextAlign.justify),
      ),
    ],
  );
}
