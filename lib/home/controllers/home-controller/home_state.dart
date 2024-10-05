part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Tweet> tweets;

  HomeLoaded({required this.tweets});
}


final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}