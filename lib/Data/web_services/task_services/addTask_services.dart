import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class AddTaskServices {

  Future<bool> AddTaskorGoal(String Url, String title, String description,String token, String amount) async {
    try {
      var response = await postRequest(
          Url,
          jsonEncode(<String, dynamic>{
            "title": title,
            "description": description,
            "amount":amount!=""?int.parse(amount):0,
           // "repetition":"Once"
          }),token);
      if (response.statusCode == 201) {
        print(response.body);
        return true;
      } else {
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
