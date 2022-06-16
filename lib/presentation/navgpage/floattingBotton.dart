import 'package:bank_misr/presentation/addTasksGoals/addTask/add_task.dart';
import 'package:bank_misr/presentation/goals/addGoalView.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/tasks/addTaskView.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../addTasksGoals/addGoal/add_goal.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class floattingbotton extends StatefulWidget {
  BuildContext context2;
  floattingbotton(this.context2);



  @override
  State<floattingbotton> createState() => _floattingbottonState(context2);
}

class _floattingbottonState extends State<floattingbotton> {
  BuildContext context2;

  _floattingbottonState(this.context2);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    alignment: Alignment.center,
      actions: <Widget>[
        DialogButton(
          color:ColorManager.primary,
          height: 50,

          child: Text(
            AppStrings.addTask.tr(),
            style: TextStyle(color: ColorManager.white, fontSize: FontSize.s20),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            pushNewScreen(context2, screen:AddTaskView(),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);

            // Navigator.pushNamed(context, Routes.addTaskViewRoute);
          },

        ),
        DialogButton(
          color:ColorManager.primary,
          height: 50,
          child: Text(
            AppStrings.addGoal.tr(),
            style: TextStyle(color: ColorManager.white, fontSize: FontSize.s20),

          ),
          onPressed: () {
            Navigator.of(context).pop();
            pushNewScreen(context2, screen:AddGoalView(),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
            // Navigator.of(context).pop();
            //
            // Navigator.pushNamed(context, Routes.addGoalViewRoute);
          },


        ),
      ],
    );
  }




}
