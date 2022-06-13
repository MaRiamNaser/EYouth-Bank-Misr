import 'dart:convert';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class balanceServices
{
  Future<String> EditBalance (String token,int amount)async
  {
    try{
      var response= await putRequest(balanceLink,jsonEncode(<String, dynamic>{
        "balance": amount,
      }), token);
      print(response.statusCode);
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}