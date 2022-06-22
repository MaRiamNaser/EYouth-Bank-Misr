import 'dart:convert';

import 'package:bank_misr/data/web_services/registration_services/registeration_services.dart';

class SignUpRepo {
  final RegisterationWebServices _registerationWebServices;
  SignUpRepo(this._registerationWebServices);

  Future<bool> signUp(String fullname,String username,String email,String password,String age) async {
    var body = await _registerationWebServices.signUp(fullname, username, email, password, age);
    var jsonresponse = json.decode(body);
    var apiStatus = jsonresponse["apiStatus"];
  
    return apiStatus;
  }
   Future<bool> isEmailExist(String email) async {
    var body = await _registerationWebServices.isEmailExist(email);
    var jsonresponse = json.decode(body);
    var isEmailExist = jsonresponse["data"];
    return isEmailExist;
  }

     Future<bool> isUserNameExist(String userName) async {
    var body = await _registerationWebServices.isUserNameExist(userName);
    var jsonresponse = json.decode(body);
    var isUserNameExist = jsonresponse["data"];
    return isUserNameExist;
  }

}
