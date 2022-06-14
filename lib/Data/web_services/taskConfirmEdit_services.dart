


import 'package:bank_misr/presentation/addTasksGoals/edit_task.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../presentation/addTasksGoals/edit_goal/edit_goal.dart';
import '../../presentation/goals/goals_view.dart';


class taskConfirmEditServices
{   
     //TODO rename the service and page.
  void confirmEdit(String Id,String Title, String Description,BuildContext context) {
    // TODO remove this ui and put  to presentation layer , just leave the request to server
    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTask(Id,Title,Description)));
  }

}
