import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_apps/services/auth_service.dart';
import 'package:my_apps/services/user_service.dart';

import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel model =
          await AuthService.login(email: email, password: password);
      if (model.code == 200) {
        emit(AuthSuccess(model));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());
      String res = await AuthService.logout();
      if (res == 'User berhasil logout') {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser() async {
    try {
      UserModel user = await UserService.getLocalUser();
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
