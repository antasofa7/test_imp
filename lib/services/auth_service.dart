import 'dart:convert';

import 'package:my_apps/models/error_auth_model.dart';
import 'package:my_apps/models/users_model.dart';
import 'package:my_apps/services/user_service.dart';
import 'package:my_apps/utils/constans.dart';
import 'package:http/http.dart' as http;

const String _endPoint = 'auth/login';
const String _url = baseUrl + _endPoint;

class AuthService {
  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      var body = {'email': email, 'password': password};

      var response = await http.post(Uri.parse(_url),
          headers: {
            "Authorization": 'Bearer $token',
          },
          body: body);

      if (response.statusCode == 200) {
        UserService().setLocalUser(response.body);
        return UsersModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        return ErrorAuthModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    UserService().removeLocalUser();
  }
}
