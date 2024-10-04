part of 'splash_screen_cubit.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

//have two states authenticaed and unauthenticated
final class SplashScreenAuthenticated extends SplashScreenState {}

final class SplashScreenUnauthenticated extends SplashScreenState {}