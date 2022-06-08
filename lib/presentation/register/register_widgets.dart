import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Widget nameTextFormField(TextEditingController fullNameController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: fullNameController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourName;
        }
        return null;
      },

      // controller: _phoneController,
      // keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: AppStrings.name,
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
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: emailController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourEmail;
        }
        return null;
      },

      // controller: _phoneController,
      // keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: AppStrings.email,
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

Widget userNameTextFormField(TextEditingController fullNameController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: fullNameController,
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

Widget ageTextFormField(TextEditingController ageController) {
  return Container(
    margin: EdgeInsets.only(
        left: AppMargin.m20, right: AppMargin.m20, top: AppMargin.m30),
    child: TextFormField(
      controller: ageController,
      validator: (val) {
        if (val!.isEmpty) {
          return AppStrings.pleaseEnterYourAge;
        }
        return null;
      },

      // controller: _phoneController,
      // keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: AppStrings.age,
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

class ContinueButton extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  ContinueButton(this.formKey, this.fullNameController, this.emailController,
      this.ageController, this.userNameController, this.passwordController);

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
        onPressed: ()  async{
          if (registerationProviderWatch.index <= 4) {
            if (registerationProviderWatch.index == 0) {
              if (formKey.currentState!.validate()) {
                registerationProviderRead.setFullName(fullNameController.text);
                registerationProviderRead.increaseIndex();
              }
            }else if (registerationProviderWatch.index == 1) {
              if (formKey.currentState!.validate()) {
                registerationProviderRead.setEmail(emailController.text);
                registerationProviderRead.increaseIndex();
              }
            }  else if (registerationProviderWatch.index == 2) {
              if (formKey.currentState!.validate()) {
                registerationProviderRead.setAge(ageController.text);
                registerationProviderRead.increaseIndex();
              }
            } else if (registerationProviderWatch.index == 3) {
              if (formKey.currentState!.validate()) {
                registerationProviderRead.setUserName(userNameController.text);
                registerationProviderRead.increaseIndex();
              }
            }
            else if (registerationProviderWatch.index == 4) {
              if (formKey.currentState!.validate())  {
                registerationProviderRead.setPassword(passwordController.text);
                print(registerationProviderRead.index);
                
           await registerationProviderRead.signUp();
           

        print("zft");
         print(  registerationProviderWatch.registerStatus);

          if(registerationProviderWatch.registerStatus == true){
            print("user added!");
          
            showFlutterToast("You are registred successfully ^^");
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
            //  registerationProviderRead.changeregisterStatus(false);
           
          }else{
            print("user not added !");
             showFlutterToast("Something went wrong!!");

          }
              }
            }

           
          }
        },
        child: Text(AppStrings.continueString),
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
