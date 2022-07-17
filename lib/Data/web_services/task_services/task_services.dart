import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/resources/strings_manager.dart';
import '../../api_links.dart';

class TaskServices {

  ///* Request from Api to get all tasks for one user
  Future<String> GetAllTasks(String token, userid) async {
    try {
      var response = await http.get(
        Uri.parse(
            EndPoints().getTasksLink+userid),
        headers: <String, String>{
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader:
          token
        },
      );
      return response.body;
    } catch (e) {
      return "Error";
    }
  }
}