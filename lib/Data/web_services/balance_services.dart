import 'dart:convert';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class balanceServices
{
  Future<String> EditBalance (String token,int amount)async
  {    EndPoints endPoints=EndPoints();
    try{
      var response= await putRequest(endPoints.balanceLink,jsonEncode(<String, dynamic>{
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