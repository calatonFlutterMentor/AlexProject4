import 'package:flutter/material.dart';

import '../../routing/navigator_util.dart';
import '../common/widgets/input_field.dart';
import '../common/widgets/main_button.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({
    super.key,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String userInputText = "";

  String homeScreenText = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
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
                  args,
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
                  NavigatorUtil().navigateBack(data: userInputText);
                  setState(() {
                    homeScreenText = args;
                  });
                },
                text: "Home Screen",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
