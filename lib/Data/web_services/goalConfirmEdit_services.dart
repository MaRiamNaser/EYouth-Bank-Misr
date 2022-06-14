

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../presentation/addTasksGoals/edit_goal/edit_goal.dart';
import '../../presentation/goals/goals_view.dart';


class confirmEditServices
{
  void confirmEdit(String Id,String Title, String Description,BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditGoal(Id,Title,Description)));
  }

}
