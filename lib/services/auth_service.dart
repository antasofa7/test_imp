import 'dart:convert';

import 'package:my_apps/helper/dio_exception.dart';
import 'package:my_apps/helper/dio_helper.dart';
import 'package:my_apps/models/user_model.dart';
import 'package:my_apps/services/user_service.dart';
import 'package:dio/dio.dart';

class AuthService {
  static Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      var data = {'nip': email, 'password': password};

      final Response response =
          await DioHelper.post('auth/login', data: data, withToken: false);
      if (response.statusCode == 200) {
        UserService.setLocalUser(jsonEncode(response.data));
        var model = UserModel.fromJson(response.data);
        return model;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<dynamic> logout() async {
    try {
      final Response response = await DioHelper.post('logout');
      if (response.statusCode == 200) {
        UserService.removeLocalUser();
        return response.data?['message'];
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
