import 'package:flutter/material.dart';

import '../../routing/navigator_util.dart';
import '../common/widgets/main_button.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(child:
          MainButton(
            onPressedFunction: () {
              NavigatorUtil().navigateBack();
            },
            text: "Home Screen",
          ),)
        ),
      ),
    );
  }
}