import 'package:bank_misr/presentation/resources/theme_manager.dart';

import 'package:flutter/material.dart';

import '../presentation/bottomBar/bottomBar.dart';
import '../presentation/courses/coursesView.dart';
import '../presentation/goals/addGoalView.dart';
import '../presentation/goals/goals_view.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/setting/setting.dart';
import '../presentation/tasks/addTaskView.dart';
import '../presentation/tasks/tasks_view.dart';
import '../presentation/setting/setting.dart';

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
      home: coursesView(),
    );
  }
}