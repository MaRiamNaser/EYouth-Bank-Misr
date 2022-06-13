import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class ProfileServices
{
  Future<String> GetProfile (String token)async
  {
    try{
      var response= await getRequest(profileLink,token: token);
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }
}