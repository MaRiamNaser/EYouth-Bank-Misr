import 'package:bank_misr/Data/models/Task.dart';
import 'package:bank_misr/Data/repo/task_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepo taskRepo;
  List<Task> tasks=[];
  TaskCubit(this.taskRepo) : super(TaskInitial());
  Future<List<Task>> GetAllTasks(token)
  async{
    tasks=await taskRepo.GetAllTasks(token);
    emit(TasksLoaded(tasks));
    return tasks;
  }

}
