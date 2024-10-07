import 'package:c2pa_twitter/models/tweet.dart';

import '../models/user.dart';

class TweetHelperService {
  int _currentId = 0;
  List<Tweet> mockTweets = [
    Tweet(
      content: 'This is a mock tweet from user1',
      authorId: 1,
      media: ['https://picsum.photos/200/300'],
      likes: 10,
      retweets: 5,
    ),
    Tweet(
      content: 'This is a mock tweet from user2',
      authorId: 2,
      media: [],
      likes: 20,
      retweets: 10,
    ),
    Tweet(
      content: 'Another tweet from user1 with media',
      authorId: 1,
      media: [
        'https://picsum.photos/200/300',
        'https://picsum.photos/seed/picsum/200/300'
      ],
      likes: 15,
      retweets: 7,
    ),
    Tweet(
      content: 'User2 shares an interesting article',
      authorId: 2,
      media: ['https://picsum.photos/200/300?grayscale'],
      likes: 25,
      retweets: 12,
    ),
    Tweet(
      content: 'User3 joins the conversation',
      authorId: 3,
      media: [],
      likes: 5,
      retweets: 2,
    ),
    Tweet(
      content: 'User4 posts a funny meme',
      authorId: 4,
      media: [],
      likes: 30,
      retweets: 20,
    ),
    Tweet(
      content: 'User5 shares a video',
      authorId: 5,
      media: [],
      likes: 40,
      retweets: 25,
    ),
    Tweet(
      content: 'User6 talks about Flutter development',
      authorId: 6,
      media: [],
      likes: 50,
      retweets: 30,
    ),
  ];

  Future<int> createTweet(Tweet tweet) async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 1));
      _currentId++;
      // Simulate network response
      return _currentId;
    } catch (e) {
      throw Exception('Failed to create tweet');
    }
  }

  Future<bool> deleteTweet(int id) async {
    try {
      // Simulate network delay
      // Simulate network delay
      await Future.delayed(Duration(seconds: 1));
      // Simulate network response
      return true; // Assume the tweet was successfully deleted
    } catch (e) {
      throw Exception('Failed to delete tweet');
    }
  }

  Future<Tweet?> fetchTweetById(int id) async {
    // Simulate network delay
    try {
      await Future.delayed(Duration(seconds: 1));
      return Tweet(
        likes: 10,
        retweets: 20,
        content: 'Sample tweet content',
        authorId: 1,
        media: ['sample_media_url'],
      ); // Return a sample tweet
    } catch (e) {
      throw Exception('Failed to fetch tweet');
    }
  }

  //write a function which gets the user home feed here and returns a list of tweets
  //for now simulate a delay and send the mock tweets instead
  Future<List<Tweet>> getHomeFeed(User user) async {
    // Simulate network delay
    try {
      await Future.delayed(Duration(seconds: 3));
      // Simulate network response
      return mockTweets; // Return a list of tweets
    } catch (e) {
      throw Exception('Failed to get home feed');
    }
  }

   Future<List<Tweet>> getUserTweets(int userId) async {
    // Simulate network delay
    try {
      await Future.delayed(Duration(seconds: 3));
      // Simulate network response
      return mockTweets; // Return a list of tweets
    } catch (e) {
      throw Exception('Failed to get home feed');
    }
  }
}
