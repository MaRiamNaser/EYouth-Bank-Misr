import 'dart:convert';

import 'package:bank_misr/data/web_services/registration_services/registeration_services.dart';

class SignUpRepo {
  final RegisterationWebServices _registerationWebServices;
  SignUpRepo(this._registerationWebServices);

  Future<String> signUp(String fullname,String username,String email,String password,String age) async {
    print(fullname+" "+username+" "+email+" "+password+"*************************");

    var body = await _registerationWebServices.signUp(fullname, username, email, password, age);
   // print(body.toString());
       if(body != null){
    var jsonresponse = json.decode(body);
    var apiStatus = jsonresponse["apiStatus"];
    var Message = jsonresponse["message"];
    if(apiStatus)
     return "True";
    else {
      print("jjjjjjjjjjjjjjjjj");
      return Message;
    }
    }
  return "False";
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
