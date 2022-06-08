import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

class GoalServices
{
  Future<String> GetAllGoals (String Url)async
  {
    try{
      var response= await http.get(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/getall'),
          headers: <String,String>{"Content-Type": "application/json",
            HttpHeaders.authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmEwNjI4NzQzNWIxNTNlYTVlNzNkZjAiLCJpYXQiOjE2NTQ2Nzk4NTN9.a4wUDqu7ZMjHsr4tiUUajjCc0v5Xy0al6cf_fi6rzM0"
          },
      );
      return response.body;

    }catch(e)
    {
      return "Error";
    }
  }

}