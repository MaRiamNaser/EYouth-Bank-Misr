import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class AddTaskServices {
  Future<bool> AddTaskorGoal(String Url, String title, String description,String token, String? userid, String amount) async {
    try {
      print(Url);
      var response = await postRequest(
          Url+userid!,
          jsonEncode(<String, dynamic>{
            "title": title,
            "description": description,
            "amount":amount!=""?int.parse(amount):0,
           // "repetition":"Once"
          }),token);
      if (response.statusCode == 201) {
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
