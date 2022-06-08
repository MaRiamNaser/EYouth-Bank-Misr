import 'package:bank_misr/Data/repo/video_repo.dart';
import 'package:bank_misr/Data/web_services/video_services.dart';
import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/business_logic/videoBloc/video_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/addTasksGoals/addTask/add_task.dart';
import 'package:bank_misr/presentation/bottomBar/bottomBar.dart';
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

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/repo/course_repo.dart';
import '../../Data/repo/profile_repo.dart';
import '../../Data/web_services/profile_services.dart';
import '../../Data/web_services/Course_services.dart';
import '../../business_logic/profileBloc/profile_cubit.dart';
import '../../business_logic/profileBloc/profile_cubit.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String tasksRoute = "/tasks";
  // ahmed
  static const String homeViewRoute = "/homeViewRoute";
  static const String profileViewRoute = "/profileViewRoute";
  static const String courseViewRoute = "/courseViewRoute";
  static const String videoViewRoute = "/videoViewRoute";

   static const String addTaskViewRoute = "/addTaskViewRoute";
   static const String addGoalViewRoute = "/addGoalViewRoute";
  static const String homeLayout = "/homeLayout";



  static const String addTasksRoute = "/tasks";
  static const String addGoalRoute = "/goals";
  static const String goals= "/goals";

}

class blocGenerator {
  late CourseRepo courseRepo;
  late CourseCubit courseCubit;
  late VideoRepo videoRepo;
  late VideoCubit videoCubit;
  late ProfileRepo profileRepo;
  late ProfileCubit profileCubit;

  blocGenerator() {
    courseRepo = CourseRepo(CourseServices());
    courseCubit = CourseCubit(courseRepo);
    videoRepo = VideoRepo(VideoServices());
    videoCubit = VideoCubit(videoRepo);
    profileRepo = ProfileRepo(ProfileServices());
    profileCubit = ProfileCubit(profileRepo);
  }
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

        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => blocGenerator().profileCubit,
              child: HomeView(),
            ));

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.tasksRoute:
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
      case Routes.addTasksRoute:
        return MaterialPageRoute(builder: (_) => addTasklview());
      case Routes.goals:
        return MaterialPageRoute(builder: (_) => Goalsview());

      case Routes.addGoalRoute:
        return MaterialPageRoute(builder: (_) => addGoalview());
      case Routes.profileViewRoute:
        return MaterialPageRoute(builder: (_) =>BlocProvider(
          create: (context) => blocGenerator().profileCubit,
          child: ProfileView(),
        )
        );
      case Routes.courseViewRoute:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => blocGenerator().videoCubit,
              child: CourseView(),
            ));
      case Routes.videoViewRoute:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => blocGenerator().videoCubit,
              child: VideoView(),
            ));
      case Routes.addTaskViewRoute:
        return MaterialPageRoute(builder: (_) => AddTaskView());
      case Routes.addGoalViewRoute:
        return MaterialPageRoute(builder: (_) => AddGoalView());

      case Routes.homeLayout:
        return MaterialPageRoute(builder: (_) => BottomBar());



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
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