import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class ProfileServices
{
  Future<String> GetProfile (String token, String userid)async
  {
    /// Request from Api to Get User Profile details
    EndPoints endPoints=EndPoints();
    try{
      var response= await getRequest(endPoints.profileLink+userid,token: token);
      print(response.statusCode);
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }
  Future<String> SearchKid (String token,String username)async
  {
    /// Request from Api to Get User Profile details
    EndPoints endPoints=EndPoints();
    try{
      var response= await postRequest(endPoints.SearchKid,
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
  Future<String> AddKid (String token,String username,String parentid)async
  {
    /// Request from Api to Get User Profile details
    EndPoints endPoints=EndPoints();
    print(endPoints.AddKid+parentid);
    try{
      var response= await putRequest(endPoints.AddKid+parentid,
          jsonEncode(
              <String, String>{
                "username": username
              }),token);
      print(response.body);
      print(response.statusCode);
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}