import 'package:calaton_fourth_project/app/routing/inavigation_util.dart';
import 'package:flutter/material.dart';

class NavigatorUtil implements INavigationUtil {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final NavigatorUtil _instance = NavigatorUtil._();

  factory NavigatorUtil() {
    return _instance;
  }

  NavigatorUtil._();

  @override
  bool get canPop => navigatorKey.currentState!.canPop();

  @override
  void navigateBack({data}) {
   return navigatorKey.currentState!.pop(data);
  }

  @override
  void navigateBackToStart() {
    // TODO: implement navigateBackToStart
  }

  @override
  void navigateBackUntilNamed(String named) {

  }

  @override
  Future navigateTo<T extends Object?>(String routeName,
      {bool allowBackNavigation = true, data}) {
    return navigatorKey.currentState!.pushNamed(routeName,arguments: data);
  }

  @override
  Future navigateToAndMakeRoot<T extends Object?>(String routeName, {data}) {
   return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
