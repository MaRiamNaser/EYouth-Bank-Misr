import 'dart:io';

import 'package:http/http.dart' as http;

class ProfileServices
{
  Future<String> GetProfile (String Url)async
  {
    try{
      var response= await http.get(Uri.parse("http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/user/myaccount"),headers: <String,String>{"Content-Type": "application/json",
        HttpHeaders.authorizationHeader:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjlkY2I3ODRhYzJmYTZhN2IxZTVlYzEiLCJpYXQiOjE2NTQ1MDg0NzV9.8sn7kPF4R35q6G1DZ910u0VUcywEwC2sg6xGYhCxHAI "});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}