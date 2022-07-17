import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:http/http.dart' as http;

import '../../api_links.dart';

class GoalServices {

  ///* Request from Api to get all goals for one user
  Future<String> GetAllGoals(String token, userid) async {
    try {
      var response =
      await http.get(
        Uri.parse(
          EndPoints().getGoalsLink+userid),
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
