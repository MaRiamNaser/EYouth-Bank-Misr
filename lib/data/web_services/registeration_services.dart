import 'dart:convert';

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
          await http.post(Uri.parse(AppStrings.baseUrl + "user/login"),
              headers: <String, String>{
                "Content-Type": "application/json",
              },
              body: jsonEncode(<String, String>{
            
                "email": email,
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

  Future<bool> signUp(String fullname, String username, String email,
      String password, String age) async {
   
     try {
      Response response = await dio.post(
          'user/register',
         data:jsonEncode(<String, String>{
                "fullname": fullname,
                "username": username,
                "email": email,
                "password": password,
                "age": age
              }));

                if (response.statusCode == 200) {
                  print("Hello!");
                    return true;

                }else{
                  return false;
                }

//   print(response.data);
    
    } catch (e) {
      print(e.toString());
            return false;
    }
     

  /*  try {
      var response =
          await http.post(Uri.parse(AppStrings.baseUrl + "user/register"),
              headers: <String, String>{
                "Content-Type": "application/json",
              },
              body: jsonEncode(<String, String>{
                "fullname": fullname,
                "username": username,
                "email": email,
                "password": password,
                "age": age
              }));
              print(fullname);
               print(username);
                print(email);
                 print(password);
      if (response.statusCode == 200) {
        print("************************************************************");
        print(response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
    */

  }
}
