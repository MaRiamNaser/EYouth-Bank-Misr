import 'dart:convert';
import 'package:bank_misr/Data/web_services/task_services.dart';


import '../models/Task.dart';
import '../web_services/goal_services.dart';

class TaskRepo
{
  final TaskServices _taskServices;

  TaskRepo(this._taskServices);

  Future<List<Task>> GetAllTasks(Url)async
  {
    var body = await _taskServices.GetAllTasks(Url);
    var jsonresponse =json.decode(body) ;
    print(body);
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => Task.fromJson(e)).toList();
  }
}