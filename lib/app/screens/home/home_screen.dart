import 'package:calaton_fourth_project/app/routing/navigator_util.dart';
import 'package:calaton_fourth_project/app/routing/route_constants.dart';
import 'package:flutter/material.dart';

import '../common/widgets/input_field.dart';
import '../common/widgets/main_button.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userInputText = "";
  String secondScreenText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  secondScreenText,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InputField(
                  hintText: '',
                  errorMassage: '',
                  onValueChanged: (String value) {
                    userInputText = value;
                  },
                ),
              ),
              MainButton(
                onPressedFunction: () {
                  NavigatorUtil().navigateTo(RouteConstants.first);
                },
                text: "First Screen",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MainButton(
                  onPressedFunction: () {
                    NavigatorUtil()
                        .navigateTo(RouteConstants.second, data: userInputText)
                        .then((value) {
                      //TODO work not correct
                      setState(() {
                        secondScreenText = value;
                      });
                    });
                  },
                  text: "Second Screen",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
