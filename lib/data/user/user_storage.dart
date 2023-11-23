import 'package:calaton_fourth_project/domain/user/iuser.dart';
import 'package:calaton_fourth_project/domain/user/iuser_storage.dart';

import '../local_storage/local_storage.dart';

class UserStorage implements IUserStorage {
  final LocalStorage _localStorage;

  UserStorage({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  Future<IUser> getUser() async {
    return await _localStorage.get();
  }

  @override
  Future<void> removeUser() async {
    return await _localStorage.removeAll();
  }

  @override
  Future<void> saveUser(IUser user) async {
    return await _localStorage.put(user);
  }
}
