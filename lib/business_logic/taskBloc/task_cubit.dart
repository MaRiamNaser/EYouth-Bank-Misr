import 'package:bank_misr/Data/models/Task.dart';
import 'package:bank_misr/Data/repo/task_repo.dart';
import 'package:bank_misr/business_logic/taskBloc/task_cubit.dart';

import 'package:bank_misr/presentation/addTasksGoals/edit_task.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../Data/models/goal.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;
  List<Task> tasks=[];
  TaskCubit(this.taskRepo) : super(TaskInitial());
  var token1;
  var userid;
  Future<List<Task>> GetAllTasks(token, userid)
  async{
    tasks=await taskRepo.GetAllTasks(token,userid);
    emit(TasksLoaded(tasks));
    token1=token;
    this.userid=userid;
    return tasks;
  }
  Future<bool>DeleteTask(String id)
  async {
    bool status=await taskRepo.ConfirmDelete(id);
    if(status ==true)
    {
      emit(TaskDeleted());
      GetAllTasks(token1,userid);
      return true;
    }
    else
    {
      return false;
    }
  }
  Future<bool>EditTask(token, taskID, title, description)
  async {
    bool status=await taskRepo.ConfirmEdit(token, taskID, title, description);
    if(status ==true)
    {
      emit(TaskEdit());
      return true;
    }
    else
    {
      return false;
    }
  }

}
