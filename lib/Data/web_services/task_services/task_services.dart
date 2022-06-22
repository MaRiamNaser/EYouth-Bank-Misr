import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/resources/strings_manager.dart';
import '../../api_links.dart';

class TaskServices {
  Future<String> GetAllTasks(String token) async {
    try {
      var response = await http.get(
        Uri.parse(
            baseLink+'task/getall'),
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