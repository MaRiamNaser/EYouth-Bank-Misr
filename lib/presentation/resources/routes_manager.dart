

import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/addTasksGoals/addTask/add_task.dart';
import 'package:bank_misr/presentation/course/course_view.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/login/login_view.dart';
import 'package:bank_misr/presentation/profile/profile_view.dart';
import 'package:bank_misr/presentation/register/register_view.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/splash/splash_view.dart';
import 'package:bank_misr/presentation/tasks/tasks_view.dart';
import 'package:bank_misr/presentation/video/video_view.dart';
import 'package:flutter/material.dart';
import '../goals/addGoalView.dart';
import '../goals/goals_view.dart';
import '../tasks/addTaskView.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String tasksRoute = "/tasks";
<<<<<<< Updated upstream
  // ahmed
  static const String homeViewRoute = "/homeViewRoute";
  static const String profileViewRoute = "/profileViewRoute";
  static const String courseViewRoute = "/courseViewRoute";
  static const String videoViewRoute = "/videoViewRoute";
   static const String addTaskViewRoute = "/addTaskViewRoute";
   static const String addGoalViewRoute = "/addGoalViewRoute";
=======
  static const String addTasksRoute = "/tasks";
  static const String addGoalRoute = "/goals";
  static const String goals= "/goals";

>>>>>>> Stashed changes
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.tasksRoute:
<<<<<<< Updated upstream
        return MaterialPageRoute(builder: (_) => TasksView());
         case Routes.profileViewRoute:
        return MaterialPageRoute(builder: (_) => ProfileView());
         case Routes.courseViewRoute:
        return MaterialPageRoute(builder: (_) => CourseView());
         case Routes.videoViewRoute:
        return MaterialPageRoute(builder: (_) => VideoView());
         case Routes.addTaskViewRoute:
        return MaterialPageRoute(builder: (_) => AddTaskView());
          case Routes.addGoalViewRoute:
        return MaterialPageRoute(builder: (_) => AddGoalView());
=======
         return MaterialPageRoute(builder: (_) => TasksView());
      case Routes.addTasksRoute:
        return MaterialPageRoute(builder: (_) => addTasklview());
      case Routes.goals:
        return MaterialPageRoute(builder: (_) => Goalsview());

      case Routes.addGoalRoute:
        return MaterialPageRoute(builder: (_) => addGoalview());
>>>>>>> Stashed changes

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    AppStrings.noRouteFound), 
              ),
              body: const Center(
                  child: Text(
                      AppStrings.noRouteFound)), 
            ));
  }
}