import 'dart:convert';

import 'package:my_apps/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  late final SharedPreferences prefs;

  static const String localUserData = 'LOCAL_USER_DATA';

  static Future<void> setLocalUser(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(localUserData, value);
  }

  static Future<UserModel> getLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(jsonDecode(prefs.getString(localUserData) ?? ''));
  }

  static Future<bool?> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var user = prefs.containsKey(localUserData);
    return user;
  }

  static Future<void> removeLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(localUserData);
  }
}
