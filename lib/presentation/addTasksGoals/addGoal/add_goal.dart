import 'package:bank_misr/presentation/addTasksGoals/Widgets/AddBody.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

class AddGoal extends StatefulWidget {
  @override
  _AddGoalState createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  @override
  Widget build(BuildContext context) {
    return AddBody(AppStrings.addGoal,ImageAssets.GoalPhoto);
  }

}
