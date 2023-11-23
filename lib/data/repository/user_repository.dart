import 'package:calaton_fourth_project/data/user/user.dart';
import 'package:calaton_fourth_project/domain/user/iuser.dart';

import '../../domain/user/iuser_repository.dart';
import '../user/user_storage.dart';

class UserRepository implements IUserRepository {
  final UserStorage _userStorage;

  UserRepository({required UserStorage userStorage})
      : _userStorage = userStorage;

  @override
  Future<IUser> getUser() async {
    return await _userStorage.getUser();
  }

  @override
  Future<void> logOut() async {
    return await _userStorage.removeUser();
  }

  @override
  Future<void> singIn(String email, String password) async {
    return await _userStorage.saveUser(User(email: email, password: password));
  }
}