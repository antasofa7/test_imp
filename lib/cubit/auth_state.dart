part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel users;

  const AuthSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class AuthFailed extends AuthState {
  final String errorMessage;

  const AuthFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
