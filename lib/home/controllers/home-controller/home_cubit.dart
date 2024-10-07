import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/common/tweet-helper.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:meta/meta.dart';

import '../../../models/tweet.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.tweetHelperService,this.userDetailsService) : super(HomeInitial());
  TweetHelperService tweetHelperService ;
  UserDetailsService userDetailsService;
  List<Tweet> tweets_temp = [];

  //write a method called get tweets which will emit HomeLoading state while fetching tweets
  //and HomeLoaded state when tweets are fetched
  void getTweets() async {
    emit(HomeLoading());
    try {
      final tweets = await tweetHelperService.getHomeFeed(userDetailsService.getUser()!);
      tweets_temp.addAll(tweets);
      emit(HomeLoaded(tweets: tweets));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
