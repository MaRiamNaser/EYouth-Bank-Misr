import 'dart:convert';
import 'package:bank_misr/Data/web_services/goal_services/goalChecked_services.dart';
import 'package:bank_misr/Data/web_services/goal_services/goalConfirmDelete_services.dart';

import '../models/goal.dart';

import '../web_services/goal_services/goal_services.dart';

class GoalRepo
{
  final GoalServices _goalServices;

  GoalRepo(this._goalServices);

  Future<List<Goal>> GetAllGoals(token)async
  {
    var body = await _goalServices.GetAllGoals(token);
    print(body);
    var jsonresponse =json.decode(body) ;
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => Goal.fromJson(e)).toList();
  }
  Future<bool> ConfirmDelete(id)async
  {
    var code= await confirmDeleteServices().ConfirmDelete(id);
    if(code==200)
      {
        return true;
      }
    else
      {
        return false;
      }
  }

}