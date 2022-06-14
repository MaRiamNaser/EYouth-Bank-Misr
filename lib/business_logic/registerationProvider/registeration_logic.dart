import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/data/models/User.dart';
import 'package:bank_misr/data/web_services/registeration_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterationProvider extends ChangeNotifier {
  int index = 0;
  RegisterationWebServices registerationWebServices =
      RegisterationWebServices();

      AppPreferences appPreferences =AppPreferences();

  String? fullName;
  String? userName;
  String? email;
  String? password;
  String? age;
  bool registerStatus = false;

  User? currentUser;

  String? localToken ;

void setFullName(String fullName){
  this.fullName = fullName;

notifyListeners();
  
}

void setUserName(String userName){
  this.userName = userName;

notifyListeners();
  
}
void setEmail(String email){
  this.email = email;

notifyListeners();
  
}
void setPassword(String password){
  this.password = password;

notifyListeners();
  
}

void setAge(String age){
  this.age = age;

notifyListeners();
  
}

changeregisterStatus(bool registerStatus){
  this.registerStatus = registerStatus;
  notifyListeners();
}
  Future<bool> signUp() async{
     registerStatus = false;
   await registerationWebServices
        .signUp(this.fullName!,this.userName!,this.email!,this.password!, this.age!)
        .then((value) {
          print("*****************");
          print(value);
      registerStatus = value;
    });
    notifyListeners();
    print(registerStatus);
    return registerStatus;
  }

  Future<bool> signIn() async{
      late Map<String, dynamic> response = Map();

registerStatus =false;
 await   registerationWebServices
        .signIn(this.email!,this.password!)
        .then((value) async {
          response = jsonDecode(value);
          if(response["apiStatus"] == true){
             registerStatus = true;
             localToken = response["data"]["token"];
             currentUser = User.fromJson(response["data"]["user"]);

           appPreferences.saveTokenAndUserIdToSharedPrefrences( localToken!, currentUser!.sId!);
          }else{
            registerStatus = false;
          }
          
     
       notifyListeners();
    });
   
     print("*****************");
          print(localToken);
    return registerStatus;
  }

  void increaseIndex() {
    index = index + 1;
    notifyListeners();
  }

  void decreaseIndex() {
    index = index - 1;
    notifyListeners();
  }
}
