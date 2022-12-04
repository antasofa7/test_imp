part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UsersModel users;

  const AuthSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class AuthErrors extends AuthState {
  final ErrorAuthModel errors;

  const AuthErrors(this.errors);

  @override
  List<Object> get props => [errors];
}

class AuthFailed extends AuthState {
  final String errorMessage;

  const AuthFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
