import 'dart:convert';

import 'package:bank_misr/data/web_services/registration_services/registration_api_links.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class RegisterationWebServices {
  late Dio dio;
  late Dio authenticatedDio;
  String? token;

  RegisterationWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      headers:{"Content-Type": "application/json"}
    );
    dio = Dio(options);
    BaseOptions authenticatedDioOptions = BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        headers: {'Authorization': 'Bearer$token',  "Content-Type": "application/json"});
    authenticatedDio = Dio(authenticatedDioOptions);
  }

  Future<dynamic> signIn( String email, String password) async {
    try {
      var response =
          await http.post(Uri.parse(AppStrings.baseUrl + ApiStrings.loginLink),
              headers: <String, String>{
                "Content-Type": "application/json",
              },
              body: jsonEncode(<String, String>{
            
                "username": email,
                "password": password
                
              }));
              print(response.body);
      if (response.statusCode == 200) {
        print("************************************************************");
        print(response);
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp(String fullname, String username, String email,String password, String age) async {
     try {
      Response response = await dio.post(
          ApiStrings.registerLink,
         data:jsonEncode(<String, String>{
                "fullname": fullname,
                "username": username,
                "email": email,
                "password": password,
                "age": age
              }));

                if (response.statusCode == 200) {
                    return true;

                }else{
                  return false;
                }


    
    } catch (e) {
      print(e.toString());
            return false;
    }

  }

  Future<dynamic> isUserNameExist( String userName) async {
    try {
      var response =
          await http.post(Uri.parse(AppStrings.baseUrl + ApiStrings.isUserNameExistLink),
              headers: <String, String>{
                "Content-Type": "application/json",
              },
              body: jsonEncode(<String, String>{
                "username": userName 
              }));
              print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return false;
    }
  }

 Future<dynamic> isEmailExist( String email) async {
    try {
      var response =
          await http.post(Uri.parse(AppStrings.baseUrl + ApiStrings.isEmailExistLink),
              headers: <String, String>{
                "Content-Type": "application/json",
              },
              body: jsonEncode(<String, String>{
                "email": email
              }));
              print(response.body);
      if (response.statusCode == 200) {

        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return false;
    }
  }
}
