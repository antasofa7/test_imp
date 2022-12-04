import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/models/error_auth_model.dart';
import 'package:my_apps/services/auth_service.dart';
import 'package:my_apps/services/user_service.dart';

import '../models/users_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      dynamic res = await AuthService().login(email: email, password: password);
      if (res.status) {
        emit(AuthSuccess(res));
      } else {
        emit(AuthErrors(res));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logout() async {
    try {
      emit(AuthLoading());
      await AuthService().logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser() async {
    try {
      String currentUser = await UserService().getLocalUser();
      UsersModel user = UsersModel.fromJson(jsonDecode(currentUser));
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
