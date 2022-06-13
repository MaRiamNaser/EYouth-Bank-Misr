import 'dart:_http';
import 'dart:js';

import 'package:bank_misr/Data/web_services/taskConfirmDelete_services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../presentation/goals/goals_view.dart';


class goalChecked_services
{
  void goalChecked(id,context){
    taskconfirmDeleteServices delete= taskconfirmDeleteServices();
    delete.confirmDelete(id, context);
  }

}

