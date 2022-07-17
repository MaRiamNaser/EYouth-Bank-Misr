import 'dart:convert';
import 'package:bank_misr/Data/web_services/goal_services/goalChecked_services.dart';
import 'package:bank_misr/Data/web_services/goal_services/goalConfirmDelete_services.dart';

import '../models/goal.dart';

import '../web_services/goal_services/goalConfirmEdit_services.dart';
import '../web_services/goal_services/goal_services.dart';

class GoalRepo
{
  final GoalServices _goalServices;

  GoalRepo(this._goalServices);
  ///* Call goal Web Service to get Data of goals
  Future<List<Goal>> GetAllGoals(token, userid)async
  {
    var body = await _goalServices.GetAllGoals(token,userid);
  //  print(body);
    var jsonresponse =json.decode(body) ;
    var list = jsonresponse["data"] as List<dynamic>;
    return list.map((e) => Goal.fromJson(e)).toList();
  }
  ///* Call goal Web Service to delete goal by using id
  Future<bool> ConfirmDelete(id)async
  {
    var code= await goalConfirmDeleteServices().ConfirmDelete(id);
    if(code==200)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
  ///* Call goal Web Service to Edit goal by using (token ,Id,title,Description)
  Future<bool> ConfirmEdit(token,goalID,title,description)async
  {
    var code= await goalConfirmEdit().Edit(token,goalID,title,description);
    print(code+" ssssssssssssssssssss");
    if(code=="200")
    {
      return true;
    }
    else
    {
      return false;
    }
  }

}