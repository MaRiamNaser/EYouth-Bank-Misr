import 'package:bank_misr/Data/models/Task.dart';
import 'package:bank_misr/Data/repo/task_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;
  List<Task> tasks=[];
  TaskCubit(this.taskRepo) : super(TaskInitial());
  var token1;
  Future<List<Task>> GetAllTasks(token)
  async{
    tasks=await taskRepo.GetAllTasks(token);
    emit(TasksLoaded(tasks));
    token1=token;
    return tasks;
  }
  Future<bool>DeleteTask(String id)
  async {
    bool status=await taskRepo.ConfirmDelete(id);
    if(status ==true)
    {
      emit(TaskDeleted());
      GetAllTasks(token1);
      return true;
    }
    else
    {
      return false;
    }
  }

}
