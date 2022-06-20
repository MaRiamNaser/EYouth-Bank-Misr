part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TasksLoaded extends TaskState
{
  final List<Task> tasks;
  TasksLoaded(this.tasks);
}
class TasksError extends TaskState
{

}
class TaskDeleted extends TaskState
{

}