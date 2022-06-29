import 'dart:convert';

import 'package:bank_misr/data/web_services/registration_services/registeration_services.dart';

class SignUpRepo {
  final RegisterationWebServices _registerationWebServices;
  SignUpRepo(this._registerationWebServices);

  Future<bool> signUp(String fullname,String username,String email,String password,String age) async {
    var body = await _registerationWebServices.signUp(fullname, username, email, password, age);
       if(body != null){
    var jsonresponse = json.decode(body);
    var apiStatus = jsonresponse["apiStatus"];
     return apiStatus;
    }
    
  return false;
   
  }
   Future<bool> isEmailExist(String email) async {
    var isEmailExist;
    var body = await _registerationWebServices.isEmailExist(email);

    if(body != null){
    var jsonresponse = json.decode(body);
     isEmailExist = jsonresponse["data"];
    return isEmailExist;
    }

    return isEmailExist;
  }

     Future<bool> isUserNameExist(String userName) async {
    var body = await _registerationWebServices.isUserNameExist(userName);
    var jsonresponse = json.decode(body);
    var isUserNameExist = jsonresponse["data"];
    return isUserNameExist;
  }

}
