import 'dart:convert';



import 'package:bank_misr/Data/web_services/task_services/taskConfirmDelete_services.dart';

import '../models/Task.dart';

import '../web_services/task_services/taskConfirmEdit_services.dart';
import '../web_services/task_services/task_services.dart';

class TaskRepo
{
  final TaskServices _taskServices;

  TaskRepo(this._taskServices);
  ///* Call task Web Service to get Data of tasks
  Future<List<Task>> GetAllTasks(token, userid)async
  {
    print(userid+" *******************");
    var body = await _taskServices.GetAllTasks(token,userid);
    var jsonresponse =json.decode(body) ;
    print(body);
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => Task.fromJson(e)).toList();
  }
  ///* Call task Web Service to delete goal by using id
  Future<bool> ConfirmDelete(id)async
  {
    var code= await taskConfirmDeleteServices().ConfirmDelete(id);
    if(code==200)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  ///* Call task Web Service to Edit task by using (token ,Id,title,Description)
  Future<bool> ConfirmEdit(token,goalID,title,description)async
  {
    var code= await taskConfirmEdit().Edit(token,goalID,title,description);
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