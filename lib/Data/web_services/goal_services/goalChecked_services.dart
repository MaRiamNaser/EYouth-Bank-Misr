import 'dart:io';

import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/resources/strings_manager.dart';
import '../../api_links.dart';

class goalConfirmChecked {
  ///* Request from Api to delete this goal
  Future<String> Checked(String token, String goalID) async {
    try {
      var response=await  http.delete(Uri.parse(EndPoints().deleteGoalLink+goalID),
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
