import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

class goalConfirmChecked {
  Future<String> Checked(String token, String goalID) async {
    try {
      var response=await  http.delete(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/delete/$goalID'),
        headers: <String,String>{"Content-Type": "application/json",
          HttpHeaders.authorizationHeader:token
        },
      );
      return response.body;
    } catch (e) {
      return "Error";
    }
  }
}
