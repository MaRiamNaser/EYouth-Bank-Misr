

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../Data/models/Task.dart';
import '../../Data/web_services/balance_services.dart';
import '../../Data/web_services/task_services/taskConfirmChecked_services.dart';
import '../../Data/web_services/task_services/taskConfirmDelete_services.dart';
import '../../business_logic/taskBloc/task_cubit.dart';
import '../addTasksGoals/edit_task.dart';
import '../home/parentHomeView/parentHomeView.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
late GlobalKey<ScaffoldState> _scaffoldKey ;

Widget buildtask(Task task, int index ,context,checked, token) => Padding(
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
                      task.title,
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    parentrole!=1?IconButton(
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 28,
                        ),
                        onPressed: () async {
                          var undo = false;
                          await ScaffoldMessenger.of(_scaffoldKey.currentContext!)
                              .showSnackBar(SnackBar(
                            content: const Text('Task Has Been Done'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                undo = true;
                              },
                            ),
                            duration: Duration(seconds: 4),

                          )).closed.then((value)
                          async {
                            if (undo == false) {
                              checked.Checked(token, task.id);
                              await balanceServices()
                                  .EditBalance(token, 20);
                              showDialog(
                                context: context,
                                builder: (BuildContext context1) {
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      scrollable: true,
                                      backgroundColor: ColorManager.primary,
                                      title: Center(
                                        child: Text(
                                          AppStrings.Well_Done.tr(),
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
                                              "assets/images/7455-loading1.json",
                                              height: 145,
                                              width: 250,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  width: 190,
                                                  child: Text(
                                                    AppStrings
                                                        .EGP2_Has_Been_Added_To_Your_Wallet
                                                        .tr(),
                                                    style: getSemiBoldStyle(
                                                        fontSize: 14,
                                                        color: ColorManager
                                                            .white),
                                                    textAlign:
                                                    TextAlign.center,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Center(
                                            child: Container(
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
                                                  Navigator.of(context1).pop();
                                                  BlocProvider.of<TaskCubit>(
                                                      context)
                                                      .DeleteTask(task.id);
                                                },
                                              ),
                                            )),
                                      ]);
                                },
                              );
                            }
                          });
                        }):SizedBox(),
                    IconButton(
                      icon: (Icon(Icons.edit_rounded)),
                      color: ColorManager.black,
                      onPressed: () {
                        // edit.confirmEdit(task.id, task.title,
                        //     task.description, context);
                        pushNewScreen(context,
                            screen:  EditTask(task.id,task.title,task.description),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                    ),
                    IconButton(
                      icon: (Icon(Icons.delete_rounded)),
                      color: ColorManager.error,
                      onPressed: () {
                        // confirmDelete(goal.id);
                        // delete.confirmDelete(goal.id, context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context1) =>
                                AlertDialog(
                                  title: Text("Delete"),
                                  content: Text(" Are you sure !?"),
                                  actions: [
                                    FlatButton(
                                      child: Text("yes"),
                                      onPressed: () async {
                                        BlocProvider.of<TaskCubit>(
                                            context)
                                            .DeleteTask(task.id);
                                        Navigator.pop(context1);
                                      },
                                    ),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context1).pop();
                                        },
                                        child: Text("no")),
                                  ],
                                ));
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