

import 'package:bank_misr/presentation/onboarding/onboarding_view.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>Container());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) =>Container());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) =>Container());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
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