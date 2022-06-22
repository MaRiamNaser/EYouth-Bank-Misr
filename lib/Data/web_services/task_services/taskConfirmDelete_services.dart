


import 'dart:io';

import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/business_logic/taskBloc/task_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/tasks/tasks_view.dart';
import '../../api_links.dart';


class taskConfirmDeleteServices
{ AppPreferences appPreferences=AppPreferences();
// TODO remove this ui and put  to presentation layer , just leave the request to server
//TODO rename the service and page.
Future<int> ConfirmDelete(id)
async {
  var response=await  http.delete(Uri.parse(
      EndPoints().deleteTaskLink+id),
      headers: <String,String>{"Content-Type": "application/json",
        HttpHeaders.authorizationHeader:await appPreferences.getLocalToken() });
  return response.statusCode;
}



}

