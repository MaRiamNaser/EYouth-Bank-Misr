import 'dart:io';
import 'package:bank_misr/Data/models/Task.dart';
import 'package:bank_misr/Data/web_services/task_services/taskConfirmDelete_services.dart';
import 'package:bank_misr/Data/web_services/task_services/taskConfirmEdit_services.dart';
import 'package:bank_misr/Data/web_services/task_services/task_services.dart';
import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/business_logic/taskBloc/task_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/addTask/add_task.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/home/parentHomeView/ParentNavBarView.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/tasks/taskWidgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../Data/repo/task_repo.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/repo/task_repo.dart';
import '../../Data/web_services/balance_services.dart';

import '../../Data/web_services/goal_services/goalConfirmEdit_services.dart';
import '../../Data/web_services/task_services/taskConfirmChecked_services.dart';
import '../addTasksGoals/edit_task.dart';
import '../bottomBar/bottomBar.dart';
import '../home/parentHomeView/parentHomeView.dart';
import '../resources/routes_manager.dart';
import 'package:http/http.dart' as http;

class TasksView extends StatefulWidget {
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  taskConfirmChecked checked = taskConfirmChecked();
  AppPreferences appPreferences = AppPreferences();
  taskConfirmDeleteServices delete = taskConfirmDeleteServices();

  // confirmEditServices edit = confirmEditServices();
  var token;
  late List<Task> tasks = [];
  bool undo = false;
  late GlobalKey<ScaffoldState> _scaffoldKey ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    Load();
  }

  Load() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    tasks = await BlocProvider.of<TaskCubit>(context).GetAllTasks(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppStrings.Tasks.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageAssets.profilePhoto,
                  fit: BoxFit.fitWidth,
                  width: 45,
                ),
                maxRadius: 34),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                children: [
                  Image.asset(
                    'assets/images/multitask.gif',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/multitask.gif',
                    fit: BoxFit.cover,
                  ),
                ],
                onPageChanged: (value) {
                  print('Page changed: $value');
                },
                isLoop: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 160,
                      width: 230,
                      child: Lottie.asset(ImageAssets.TaskPhoto)),
                ),
              ],
            ),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TasksLoaded) {
                  tasks = (state).tasks;
                  return tasks.isEmpty
                      ? Center(child: Text(AppStrings.thereIsNoTasks.tr()))
                      : Container(
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                buildtask(tasks[index], index,context,checked,token),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 0.0,
                            ),
                            itemCount: tasks.length,
                          ),
                        );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }


}
