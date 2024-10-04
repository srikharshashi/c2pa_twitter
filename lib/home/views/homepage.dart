import 'package:flutter/material.dart';
import 'package:c2pa_twitter/home/widgets/tweetwidget.dart';
class HomePage extends StatelessWidget {
  final List<Map<String, String>> mockTweets = [
    {
      'username': 'user1',
      'profilePictureUrl': 'https://via.placeholder.com/150',
      'tweetContent': 'This is a mock tweet from user1',
    },
    {
      'username': 'user2',
      'profilePictureUrl': 'https://via.placeholder.com/150',
      'tweetContent': 'This is a mock tweet from user2',
    },
    {
      'username': 'user3',
      'profilePictureUrl': 'https://via.placeholder.com/150',
      'tweetContent': 'This is a mock tweet from user3',
    },
    // Add more mock tweets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: mockTweets.length,
        itemBuilder: (context, index) {
          final tweet = mockTweets[index];
          return TweetWidget(
            username: tweet['username']!,
            profilePictureUrl: tweet['profilePictureUrl']!,
            tweetContent: tweet['tweetContent']!,
            onLikePressed: () {
              // Handle like action
            },
            onRetweetPressed: () {
              // Handle retweet action
            },
          );
        },
      ),
    );
  }
}