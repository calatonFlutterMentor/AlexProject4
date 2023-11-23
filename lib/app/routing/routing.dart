import 'package:calaton_fourth_project/app/routing/route_constants.dart';
import 'package:flutter/material.dart';

import '../screens/common/screen_factory.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.login:
        return _buildLoginScreen(settings);
      case RouteConstants.home:
        return _buildHomeScreen(settings);
       case RouteConstants.first:
         return _buildFirstScreen(settings);
      case RouteConstants.second:
        return _buildSecondScreen(settings);

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("Something went wrong!"),
                  ),
                ));
    }
  }

  static PageRoute _buildLoginScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildLogInScreen();
        },
        settings: settings);
  }

  static PageRoute _buildHomeScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildInitialScreen();
        },
        settings: settings);
  }
  static PageRoute _buildFirstScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildFirstScreen();
        },
        settings: settings);
  }
  static PageRoute _buildSecondScreen(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return ScreenFactory.buildSecondScreen();
        },
        settings: settings);
  }
}
