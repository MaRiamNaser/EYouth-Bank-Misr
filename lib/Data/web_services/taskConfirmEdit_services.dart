


import 'package:bank_misr/presentation/addTasksGoals/edit_task.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../presentation/addTasksGoals/edit_goal/edit_goal.dart';
import '../../presentation/goals/goals_view.dart';


class taskConfirmEditServices
{
  void confirmEdit(String Id,String Title, String Description,BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTask(Id,Title,Description)));
  }

}
