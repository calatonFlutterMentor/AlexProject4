import 'package:calaton_fourth_project/domain/user/iuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/storage/ilocal_storage.dart';
import '../user/user.dart';


class LocalStorage implements ILocalStorage {
  LocalStorage();

  static const String _emailKey = "email";
  static const String _passwordKey = "password";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<IUser> get() async {
    final prefs = await _prefs;
      final email = prefs.getString(_emailKey);
      final password = prefs.getString(_passwordKey);
      assert(email != null && password != null);
      return User(
        email: email!,
        password: password!,
      );
  }

  @override
  Future<void> removeAll() async {
    final prefs = await _prefs;
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
  }

  @override
  Future<void> put(IUser) async {
    final prefs = await _prefs;
      return Future.wait([
        prefs.setString(_emailKey, IUser.email),
        prefs.setString(_passwordKey, IUser.password),
      ]).then((value) => null);
  }
}