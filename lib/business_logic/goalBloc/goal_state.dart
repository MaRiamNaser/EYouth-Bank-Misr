part of 'goal_cubit.dart';

@immutable
abstract class GoalState {}

class GoalInitial extends GoalState {}

class GoalsLoaded extends GoalState
{
  final List<Goal> goals;
  GoalsLoaded(this.goals);
}
class GoalsError extends GoalState
{

}
class GoalDeleted extends GoalState
{

}