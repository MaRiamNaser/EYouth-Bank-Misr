import 'package:bank_misr/Data/repo/goal_repo.dart';
import 'package:bank_misr/Data/repo/task_repo.dart';
import 'package:bank_misr/Data/repo/video_repo.dart';

import 'package:bank_misr/business_logic/Auth/currentIndexBloc/cubit/currentindex_cubit.dart';
import 'package:bank_misr/business_logic/Auth/signInBloc/cubit/signin1_cubit.dart';
import 'package:bank_misr/business_logic/Auth/signUpBloc/cubit/signup_cubit.dart';
import 'package:bank_misr/data/repo/authentication/signin_repo.dart';
import 'package:bank_misr/data/repo/authentication/signup_repo.dart';
import 'package:bank_misr/data/web_services/registration_services/registeration_services.dart';

import 'package:bank_misr/Data/web_services/goal_services/goal_services.dart';
import 'package:bank_misr/Data/web_services/task_services/task_services.dart';
import 'package:bank_misr/business_logic/goalBloc/goal_cubit.dart';
import 'package:bank_misr/business_logic/taskBloc/task_cubit.dart';

import 'package:bank_misr/data/web_services/video_services.dart';
import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/business_logic/videoBloc/video_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/addTasksGoals/addTask/add_task.dart';
import 'package:bank_misr/presentation/choose_which_view/choose_which_view_page.dart';
import 'package:bank_misr/presentation/course/course_view.dart';
import 'package:bank_misr/presentation/courses/coursesView.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/login/login_view.dart';
import 'package:bank_misr/presentation/parent/Authentication/signin/signin_view.dart';
import 'package:bank_misr/presentation/parent/Authentication/signup/signup_view.dart';
import 'package:bank_misr/presentation/profile/profile_view.dart';
import 'package:bank_misr/presentation/register/register_view.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/splash/splash_view.dart';
import 'package:bank_misr/presentation/tasks/tasks_view.dart';
import 'package:bank_misr/presentation/video/video_view.dart';
import 'package:flutter/material.dart';
import '../../Data/models/Video.dart';
import '../goals/goals_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/repo/course_repo.dart';
import '../../Data/repo/profile_repo.dart';
import '../../Data/web_services/profile_services.dart';
import '../../Data/web_services/Course_services.dart';
import '../../business_logic/profileBloc/profile_cubit.dart';
import '../navgpage/navigation_page.dart';

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

  static const String goals = "/goals";
  static const String tasks = "/tasks";
  static const String courses = "/courses";

  //parent

  static const String parentSignInRoute = "/parentSignInRout";
  static const String parentSignUpRoute = "/parentSignUpRout";
  static const String whichViewRoute = "/whichViewRoute";
}

class blocGenerator {
  late CourseRepo courseRepo;
  late CourseCubit courseCubit;
  late VideoRepo videoRepo;
  late VideoCubit videoCubit;
  late ProfileRepo profileRepo;
  late ProfileCubit profileCubit;

  late SignInRepo signInRepo;
  late Signin1Cubit signInCubit;

  late SignUpRepo signUpRepo;
  late SignUpCubit signUpCubit;

  late CurrentindexCubit currentindexCubit;

  late GoalRepo goalRepo;
  late GoalCubit goalCubit;

  late TaskRepo taskRepo;
  late TaskCubit taskCubit;

  blocGenerator() {
    courseRepo = CourseRepo(CourseServices());
    courseCubit = CourseCubit(courseRepo);

    videoRepo = VideoRepo(VideoServices());
    videoCubit = VideoCubit(videoRepo);

    profileRepo = ProfileRepo(ProfileServices());
    profileCubit = ProfileCubit(profileRepo);

    signInRepo = SignInRepo(RegisterationWebServices());
    signInCubit = Signin1Cubit(signInRepo);

    signUpRepo = SignUpRepo(RegisterationWebServices());
    signUpCubit = SignUpCubit(signUpRepo);

    currentindexCubit = CurrentindexCubit();

    goalRepo = GoalRepo(GoalServices());
    goalCubit = GoalCubit(goalRepo);

    taskRepo = TaskRepo(TaskServices());
    taskCubit = TaskCubit(taskRepo);
  }
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => blocGenerator().signUpCubit,
                  ),
                  BlocProvider(
                    create: (context) => blocGenerator().currentindexCubit,
                  )
                ], child: RegisterView()));
      case Routes.homeViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => blocGenerator().profileCubit,
                  child: HomeView(),
                ));

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.tasksRoute:
        return MaterialPageRoute(builder: (_) => TasksView());
      case Routes.profileViewRoute:
        return MaterialPageRoute(builder: (_) => ProfileView());
      case Routes.addTaskViewRoute:
        return MaterialPageRoute(builder: (_) => AddTaskView());
      case Routes.addGoalViewRoute:
        return MaterialPageRoute(builder: (_) => AddGoalView());
      case Routes.courses:
        int i = 0;
        i = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => blocGenerator().courseCubit,
            child: coursesView(),
          ),
        );
      case Routes.goals:
        return MaterialPageRoute(builder: (_) => Goalsview());
      case Routes.tasks:
        return MaterialPageRoute(builder: (_) => TasksView());
      case Routes.profileViewRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => blocGenerator().profileCubit,
                  child: ProfileView(),
                ));
      case Routes.courseViewRoute:
        List<String> course = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => blocGenerator().videoCubit,
                  child: CourseView(course),
                ));
      case Routes.videoViewRoute:
        Video video = settings.arguments as Video;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => blocGenerator().videoCubit,
            child: VideoView(video),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case Routes.addTaskViewRoute:
        return MaterialPageRoute(builder: (_) => AddTaskView());
      case Routes.addGoalViewRoute:
        return MaterialPageRoute(builder: (_) => AddGoalView());

      case Routes.homeLayout:
        return MaterialPageRoute(builder: (_) => navgscreen());

      case Routes.parentSignInRoute:
        return MaterialPageRoute(builder: (_) => ParentSignInView());
      case Routes.parentSignUpRoute:
        return MaterialPageRoute(builder: (_) => ParentSignUpView());
      case Routes.whichViewRoute:
        return MaterialPageRoute(builder: (_) => WhichViewPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
