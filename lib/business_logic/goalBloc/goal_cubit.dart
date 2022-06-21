import 'package:bank_misr/Data/repo/goal_repo.dart';
import 'package:bank_misr/presentation/addTasksGoals/edit_goal/edit_goal.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/models/goal.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  final GoalRepo goalRepo;
  List<Goal>goals=[];
  GoalCubit(this.goalRepo) : super(GoalInitial());
  var token1;
  Future<List<Goal>> GetAllGoals(token)
   async{
    token1=token;
       goals=await goalRepo.GetAllGoals(token);
      emit(GoalsLoaded(goals));
       return goals;
     }
   Future<bool>DeleteGoal(String id)
  async {
     bool status=await goalRepo.ConfirmDelete(id);
     if(status ==true)
       {
         emit(GoalDeleted());
         GetAllGoals(token1);
         return true;
       }
     else
       {
         return false;
       }
   }
  Future<bool>EditGoal(token, goalID, title, description)
  async {
    bool status=await goalRepo.ConfirmEdit(token, goalID, title, description);
    if(status ==true)
    {
      emit(GoalEdited());
      return true;
    }
    else
    {
      return false;
    }
  }


   }
