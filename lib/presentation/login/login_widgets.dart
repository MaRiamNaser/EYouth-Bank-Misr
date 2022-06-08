import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';



Widget passwordTextFormField(TextEditingController passwordController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
         validator: (value) {
             
    if (value == null || value.isEmpty) {
     
      return 'Please enter your password';
   
    }
    return null;
  },

        controller: passwordController,
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

Widget userNameTextFormField(TextEditingController userNameController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      
    validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your user name';
    }
    return null;
  },

       controller: userNameController,
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
  final  formKey;
    final emailController;
  final passwordController;
  LoginButton(this.formKey, this.emailController, this.passwordController);
   
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
        onPressed: () async{
       if (formKey.currentState!.validate()) {
         registerationProviderRead.setEmail(emailController.text);
         registerationProviderRead.setPassword(passwordController.text);

      await  registerationProviderRead.signIn();
       print("########################################################################");
       print(registerationProviderWatch.registerStatus);

       if(registerationProviderWatch.registerStatus == true) {
           
                        showFlutterToast( " you are logged in successfully!");

                        Navigator.pushReplacementNamed(context, Routes.homeLayout);

       }else{
         showFlutterToast( " your email or password may be wrong!");
       }
    
       }
        
       
        },
        child: Text("Login"),
      ),
    );
  }
}

 showFlutterToast(String text) async{
  await     Fluttertoast.showToast(
                          msg: text,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: ColorManager.primary,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
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