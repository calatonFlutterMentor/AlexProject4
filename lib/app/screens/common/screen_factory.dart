import 'package:calaton_fourth_project/data/local_storage/local_storage.dart';
import 'package:calaton_fourth_project/data/repository/product_repository.dart';
import 'package:calaton_fourth_project/data/repository/user_repository.dart';
import 'package:calaton_fourth_project/data/user/user_storage.dart';
import 'package:flutter/material.dart';

import '../../routing/navigator_util.dart';
import '../../routing/route_constants.dart';
import '../../services/networking/network_service.dart';
import '../first/first_screen.dart';
import '../home/home_screen.dart';
import '../home/home_view_model.dart';
import 'package:provider/provider.dart';

import '../login/login_screen.dart';
import '../login/login_view_model.dart';
import '../second/second_screen.dart';

class ScreenFactory {
  static Widget buildInitialScreen() {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
          productRepository:
              ProductRepository(networkService: NetworkService()),
          userRepository: UserRepository(
              userStorage: UserStorage(localStorage: LocalStorage()))),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return FutureBuilder(
            future: model.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userEmail = snapshot.data?.email;
                final userPassword = snapshot.data?.password;
                if (userEmail != null && userPassword != null) {
                  return HomeScreen(viewModel: model);
                } else {
                  return ScreenFactory.buildLogInScreen();
                }
              } else {
                return ScreenFactory.buildLogInScreen();
              }
            },
          );
        },
      ),
    );
  }

  static Widget buildLogInScreen() {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
          userRepository: UserRepository(userStorage: UserStorage(localStorage: LocalStorage()))),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginScreen(viewModel: model),
      ),
    );
  }
  static Widget buildFirstScreen() {
    return FirstScreen();
  }
  static Widget buildSecondScreen() {
    return SecondScreen();
  }
}
