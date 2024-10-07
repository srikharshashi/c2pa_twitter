import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/common/tweet-helper.dart';
import 'package:c2pa_twitter/models/tweet.dart';

part 'profile_tweets_state.dart';

class ProfileTweetsCubit extends Cubit<ProfileTweetsState> {

  TweetHelperService tweetHelperService;

  ProfileTweetsCubit({required this.tweetHelperService}) : super(ProfileTweetsInitialState());

  void getProfileTweets(int userId,bool isSelf) async {
    emit(ProfileTweetsLoadingState());
    try {
      final tweets = await tweetHelperService.getUserTweets(userId);
      emit(ProfileTweetsLoaded(tweets: tweets));
    } catch (e) {
      emit(ProfileTweetsError(e.toString()));
    }
  }


}
