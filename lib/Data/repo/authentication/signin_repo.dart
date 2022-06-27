import 'dart:convert';

import 'package:bank_misr/data/models/User.dart';
import 'package:bank_misr/data/web_services/registration_services/registeration_services.dart';

class SignInRepo {
  final RegisterationWebServices _registerationWebServices;
  String? token;
  SignInRepo(this._registerationWebServices);

  Future<User?> signIn(String email, String password) async {
    var body = await _registerationWebServices.signIn(email, password);
    if(body!=null) {
      var jsonresponse = json.decode(body);
      var user = jsonresponse["data"]["user"];
      token = jsonresponse["data"]["token"];
      return User.fromJson(user);
    }
    else
      {
        return null;
      }
  }

  String? getToken() {
    if (token != null) {
      return token;
    } else {
      return "";
    }
  }
}
