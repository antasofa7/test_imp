import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  late final SharedPreferences prefs;

  static const String localUserData = 'LOCAL_USER_DATA';

  Future<void> setLocalUser(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(localUserData, value);
  }

  Future<String> getLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(localUserData) ?? '';
  }

  Future<bool?> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var user = prefs.containsKey(localUserData);
    return user;
  }

  Future<void> removeLocalUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(localUserData);
  }
}
