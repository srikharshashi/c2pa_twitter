part of 'profile_tweets_cubit.dart';

sealed class ProfileTweetsState {}

final class ProfileTweetsInitialState extends ProfileTweetsState {}

//write 3 states for loading, loaded and error
final class ProfileTweetsLoadingState extends ProfileTweetsState {}

final class ProfileTweetsLoaded extends ProfileTweetsState {
  final List<Tweet> tweets;
  final bool isOwnProfile;

  ProfileTweetsLoaded({
    required this.tweets,
    this.isOwnProfile = false,
  });
}

final class ProfileTweetsError extends ProfileTweetsState {
  final String message;

  ProfileTweetsError(this.message);
}