import 'package:calaton_fourth_project/app/routing/navigator_util.dart';
import 'package:calaton_fourth_project/app/routing/route_constants.dart';
import 'package:calaton_fourth_project/app/screens/common/widgets/input_field.dart';
import 'package:flutter/material.dart';

import '../common/screen_factory.dart';
import '../common/widgets/main_button.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  String emailValue = '';
  String passwordValue = '';

  void updateEmailValue(String value) {
    emailValue = value;
  }

  void updatePasswordValue(String value) {
    passwordValue = value;
  }

  @override
  Widget build(BuildContext context) {
    final formKeyEmail = GlobalKey<FormState>();
    final formKeyPassword = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Register below with your details!',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKeyEmail,
                  child: InputField(
                    hintText: "email",
                    errorMassage: "Enter correct email",
                    onValueChanged: updateEmailValue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: formKeyPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: InputField(
                    hintText: "password",
                    errorMassage: "Enter correct password",
                    onValueChanged: updatePasswordValue,
                  ),
                ),
              ),
              MainButton(
                text: "Sing in",
                onPressedFunction: () async {
                  final validateEmail = formKeyEmail.currentState!.validate();
                  final validatePassword =
                      formKeyPassword.currentState!.validate();
                  if (validateEmail && validatePassword) {
                    await Future.delayed(const Duration(seconds: 2));
                    viewModel.onLogInButtonPressed(emailValue, passwordValue);
                    NavigatorUtil().navigateToAndMakeRoot(RouteConstants.home);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
