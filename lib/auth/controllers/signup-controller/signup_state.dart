part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

//write 3 states loading,succes and failure
final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String jwt;
  final String name;

  SignupSuccess(this.jwt,this.name);
}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure(this.message);
}