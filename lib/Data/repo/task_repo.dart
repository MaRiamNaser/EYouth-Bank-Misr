import 'dart:convert';



import '../models/Task.dart';

import '../web_services/task_services/task_services.dart';

class TaskRepo
{
  final TaskServices _taskServices;

  TaskRepo(this._taskServices);

  Future<List<Task>> GetAllTasks(token)async
  {
    var body = await _taskServices.GetAllTasks(token);
    var jsonresponse =json.decode(body) ;
    print(body);
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => Task.fromJson(e)).toList();
  }
}