import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class AddTaskServices
{
  Future<bool> AddTask (String Url,String title,String description )async
  {
    try{
      var response = await http.post(Uri.parse
        (
          "http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/create"),
          headers: <String, String>{
            "Content-Type": "application/json",
            HttpHeaders
                .authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmEwNmZkNjAwMDc5OTM0YWI0MDVmZjAiLCJpYXQiOjE2NTQ2OTIzNjl9.NDmkVg07AEtnPtSg85jMv2QfyG0mJpUTgXnR_CgM6ho"
          }
          , body: jsonEncode(
              <String, String>{
                "userId":"629dcb784ac2fa6a7b1e5ec1",
                "title": title,
                "description": description
              })
              );
      if(response.statusCode==200) {
        return true;
      }
      else
        {
          return false;
        }
    }catch(e)
    {
      return false;
    }
  }

}