import 'package:bank_misr/Data/models/Category.dart';
import 'package:bank_misr/presentation/addTasksGoals/Widgets/AddBody.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../Data/models/User.dart';

class AddGoalView extends StatefulWidget {
  List<User>? childs;
  AddGoalView({this.childs});

  @override
  _AddGoalViewState createState() => _AddGoalViewState(childs);
}

class _AddGoalViewState extends State<AddGoalView> {
  List<User>? childs;

  _AddGoalViewState(this.childs);

  @override
  Widget build(BuildContext context) {
    return AddBody(AppStrings.addGoal.tr(),ImageAssets.GoalPhoto,AppStrings.Goal.tr(),ImageAssets.alertGoal,childs: childs,);
  }

}
