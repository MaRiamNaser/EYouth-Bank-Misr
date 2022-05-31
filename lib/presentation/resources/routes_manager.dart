import 'dart:html';


import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>  Container());
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
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    "No Route Found"), // todo move this string to strings manager
              ),
              body: const Center(
                  child: Text(
                      "No Route Found")), // todo move this string to strings manager
            ));
  }
}