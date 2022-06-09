import 'package:bank_misr/presentation/resources/theme_manager.dart';

import 'package:flutter/material.dart';

import '../presentation/addTasksGoals/addGoal/add_goal.dart';
import '../presentation/addTasksGoals/addTask/add_task.dart';
import '../presentation/bottomBar/bottomBar.dart';
import '../presentation/course/course_view.dart';
import '../presentation/courses/coursesView.dart';
import '../presentation/goals/addGoalView.dart';
import '../presentation/goals/goals_view.dart';
import '../presentation/home/Widgets/stack_widget.dart';
import '../presentation/home/home_view.dart';
import '../presentation/login/login_view.dart';
import '../presentation/profile/profile_view.dart';
import '../presentation/register/register_view.dart';
import '../presentation/resources/routes_manager.dart';

import '../presentation/splash/splash_view.dart';


class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
      home: SplashView(),
    );
  }
}