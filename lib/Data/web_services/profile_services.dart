import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class ProfileServices
{
  Future<String> GetProfile (String token)async
  {
    /// Request from Api to Get User Profile details
    EndPoints endPoints=EndPoints();
    try{
      var response= await getRequest(endPoints.profileLink,token: token);
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }
}