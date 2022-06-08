import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;

class AddTaskServices
{
  Future<bool> AddTask (String Url,String title,String description )async
  {
    try{
      var response = await http.post(Uri.parse
        (
          "http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/Goal/addGoal"),
          headers: <String, String>{
            "Content-Type": "application/json",
            HttpHeaders
                .authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjlkY2I3ODRhYzJmYTZhN2IxZTVlYzEiLCJpYXQiOjE2NTQ1MDg0NzV9.8sn7kPF4R35q6G1DZ910u0VUcywEwC2sg6xGYhCxHAI "
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