import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

class TaskServices {
  Future<String> GetAllTasks(String Url) async {
    try {
      var response = await http.get(
        Uri.parse(
            'http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/task/getall'),
        headers: <String, String>{
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmE1YjMzMDQ2ZGNiZjBkZWVjYzQzNmUiLCJpYXQiOjE2NTUwMjcwODJ9.XdHxFQGF4NGEQik_2V-Qbw5nZaERO8J7KIALYBBwJj8"
        },
      );
      return response.body;
    } catch (e) {
      return "Error";
    }
  }
}