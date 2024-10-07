import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../controllers/home-controller/home_cubit.dart';
import '../widgets/tweetwidget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if(state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.tweets.length,
              itemBuilder: (context, index) {
                final tweet = state.tweets[index];
                return TweetWidget(
                  tweet: tweet,
                  author: User(
                    id: tweet.authorId,
                    name: "Shashi",
                    email: "ksokso",
                    password: "koskos",
                    profile: "oksoks", jwtToken: '1234',
                    followersCount: 10,
                    followingCount: 10,
                  ),
                  onLike: () {
                    // Handle like action
                  },
                  onRetweet: () {
                    // Handle retweet action
                  },
                );
              },
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
