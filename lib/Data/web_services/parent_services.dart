import 'dart:convert';

import 'package:bank_misr/Data/html_request.dart';

import '../api_links.dart';

class ParentServices
{
  Future<String> SearchKid (String token,String username)async
  {
    /// Request from Api to Get User Profile details
    EndPoints endPoints=EndPoints();
    try{
      var response= await putRequest(endPoints.SearchKid,
          jsonEncode(
              <String, String>{
                "username": username
              }),token);
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}