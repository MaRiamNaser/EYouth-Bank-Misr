
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Data/models/goal.dart';
import '../../business_logic/goalBloc/goal_cubit.dart';
import '../addTasksGoals/edit_goal/edit_goal.dart';
import '../home/parentHomeView/parentHomeView.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import 'package:path/path.dart';



Widget buildgoal(Goal goal, int index ,context, int progress) =>
   Padding(
  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
  child: Container(
    decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey, width: 1.5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      (index + 1).toString() + " -",
                      style: getMediumStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 279,
                    child: Text(
                      goal.title,
                      style: getMediumStyle(
                        fontSize: 16,
                        color: ColorManager.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Divider(
                height: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: EdgeInsets.all(13),
                      child: ProgressGoalIndicator(progress)),
                  Container(
                    margin: EdgeInsets.all(13),
                    child: Row(
                      children: [
                        Text(AppStrings.Progress.tr(),style: getLightStyle(color: Colors.black),),
                        Text(progress>100?"100 %":progress.toString()+" %",style: getRegularStyle(color: Colors.black),)
                      ],
                    ),
                  )

                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    parentrole!=1?  IconButton(
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 28,
                        ),
                        onPressed: ()
                           async {
                          await showDialog(
                                context: context,
                                builder: (BuildContext context1) {
                                  return
                                    AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      scrollable: true,
                                      backgroundColor: ColorManager.primary,
                                      title: Center(
                                        child: Text(
                                          "congratulation",
                                          style: getBoldtStyle(
                                              fontSize: 18,
                                              color: ColorManager.white),
                                        ),
                                      ),
                                      content: Container(
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Lottie.asset(
                                                  ImageAssets.GoalPhoto,
                                                  height: 145,
                                                  width: 250,
                                                ),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child:  Container(
                                                      height: 30,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(15),
                                                        color: ColorManager.darkPrimary,
                                                      ),
                                                      child: TextButton(
                                                        child: Text(
                                                          AppStrings.Ok.tr(),
                                                          style: getRegularStyle(
                                                              color:
                                                              ColorManager.white),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context1)
                                                              .pop();
                                                          BlocProvider.of<
                                                              GoalCubit>(
                                                              context)
                                                              .DeleteGoal(
                                                              goal.id);
                                                        },
                                                      ),
                                                    )
                                                ),
                                              ]
                                          )
                                      )
                                  );
                                });
                          })
                      :SizedBox(),
                    IconButton(
                      icon: (Icon(Icons.edit_rounded)),
                      color: ColorManager.black,
                      onPressed: () {
                        // edit.confirmEdit(goal.id, goal.title,
                        //     goal.description, context);
                        pushNewScreen(context,
                            screen:  EditGoal(goal.id,goal.title,goal.description),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                    ),
                    IconButton(
                      icon: (Icon(Icons.delete_rounded)),
                      color: ColorManager.error,
                      onPressed: ()  {
                        // confirmDelete(goal.id);
                        // delete.confirmDelete(goal.id, context);
                        showDialog(context: context, builder: (BuildContext context1)=>AlertDialog(
                          title: Text("Delete"),
                          content: Text(" Are you sure !?"),
                          actions: [
                            FlatButton(child: Text("yes"),
                              onPressed: () async {
                                BlocProvider.of<GoalCubit>(context).DeleteGoal(goal.id);
                                Navigator.pop(context1);
                              }, ),
                            FlatButton(onPressed: (){
                              Navigator.pop(context1);

                            }, child: Text("no")),
                          ],
                        )
                        );
                      },
                    ),
                  ]),
            ],
          ),
        ),
      ],
    ),
  ),
);

void setState(Null Function() param0) {
}





Widget ProgressGoalIndicator(int progress){
  return StepProgressIndicator(
    totalSteps: 100,
    currentStep:progress>100?100:progress,
    size: 8,
    padding: 0,
    selectedColor: Colors.blue,
    unselectedColor: Colors.grey,
    roundedEdges: Radius.circular(10),
  );
}