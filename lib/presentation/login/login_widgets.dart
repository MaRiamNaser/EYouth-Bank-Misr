import 'package:bank_misr/business_logic/registeration/registeration_logic.dart';
import 'package:bank_misr/presentation/register/register_view.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



Widget passwordTextFormField() {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourPassword;
        }
        return null;
      },

      // controller: _phoneController,
      // keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: AppStrings.password,
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

Widget userNameTextFormField() {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourUserName;
        }
        return null;
      },

      // controller: _phoneController,
      // keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: AppStrings.userName,
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

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {  
     RegisterationProvider registerationProviderRead =
              context.read<RegisterationProvider>();

               RegisterationProvider registerationProviderWatch =
              context.watch<RegisterationProvider>();
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
          foregroundColor: MaterialStateProperty.all<Color>(ColorManager.grey),
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorManager.lightPrimary),
        ),
        onPressed: () {
       
        
       
        },
        child: Text("Login"),
      ),
    );
  }
}



Widget forgetPasswordWidget(){

  return Container(
              margin: EdgeInsets.only(right: AppMargin.m20, top: AppMargin.m20, bottom: AppMargin.m20),
              child: Text(
                          "Forgot your password?",
                          style: getRegularStyle(color: ColorManager.grey),
                        ),
            );
}


Widget newToTheAppWidget(BuildContext context){

  return               Container(
                    margin:EdgeInsets.only(right: AppMargin.m20, top: AppMargin.m20, bottom: AppMargin.m20),
                    //child: Text('Don\'t have an account? Create'),
                    child: Text.rich(
                      TextSpan(children: [
                      TextSpan(text: "New to the app? ",
                       style: getRegularStyle(color: ColorManager.black,)
                       ),
                      TextSpan(
                        
                        text: 'Register',
                        
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                           Navigator.pushReplacementNamed(context, Routes.registerRoute);
                          },
                        style: getBoldtStyle(color: ColorManager.red,)
                      ),
                    ])),
                  );
}