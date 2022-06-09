import 'package:bank_misr/presentation/addTasksGoals/Widgets/AddBody.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

class AddGoalView extends StatefulWidget {
  @override
  _AddGoalViewState createState() => _AddGoalViewState();
}

class _AddGoalViewState extends State<AddGoalView> {
  @override
  Widget build(BuildContext context) {
    return AddBody(AppStrings.addGoal,ImageAssets.GoalPhoto,"Goal",ImageAssets.alertGoal);
  }

}
