part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String jwt;
  final String name;

  LoginSuccess(this.jwt,this.name);
}

final class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}