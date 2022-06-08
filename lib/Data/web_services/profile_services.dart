import 'dart:io';

import 'package:http/http.dart' as http;

class ProfileServices
{
  Future<String> GetProfile (String Url)async
  {
    try{
      var response= await http.get(Uri.parse("http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/user/myaccount"),headers: <String,String>{"Content-Type": "application/json",
        HttpHeaders.authorizationHeader:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmEwNmZkNjAwMDc5OTM0YWI0MDVmZjAiLCJpYXQiOjE2NTQ2OTIzNjl9.NDmkVg07AEtnPtSg85jMv2QfyG0mJpUTgXnR_CgM6ho"});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}