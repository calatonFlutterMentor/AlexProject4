
import 'package:calaton_fourth_project/app/routing/navigator_util.dart';
import 'package:calaton_fourth_project/app/routing/route_constants.dart';
import 'package:calaton_fourth_project/app/routing/routing.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: RouteConstants.home,
      onGenerateRoute: Routing.generateRoute,
      navigatorKey: NavigatorUtil().navigatorKey,
    );
  }
}
