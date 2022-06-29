import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/resources/strings_manager.dart';
import '../../api_links.dart';

class taskConfirmChecked {
  ///* Request from Api to delete task from user
  Future<String> Checked(String token, String taskID) async {
    try {
      var response=await  http.delete(Uri.parse(EndPoints().deleteTaskLink+taskID),
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