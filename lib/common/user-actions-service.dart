import 'package:c2pa_twitter/models/user.dart';
import '../models/tweet.dart';

class UserActionsService {
  User? user;

  //write a setter method to set the user
  void setUser(User user) {
    this.user = user;
  }

  void resetUser() {
    this.user = null;
  }

  UserActionsService();

  Future<List<Tweet>> getLikedTweets() async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        return [
          Tweet(
            content: 'Liked tweet content',
            authorId: 2,
            media: [],
            likes: 10,
            retweets: 2,
          ),
        ]; // Return a list of liked tweets
      });
    } catch (e) {
      throw Exception('Failed to get liked tweets');
    }
  }

  Future<void> unlikeTweet(Tweet tweet) async {
    // Simulate network call
    try {
      return Future.delayed(Duration(seconds: 1), () {
        // Unlike the tweet
      });
    } catch (e) {
      throw Exception('Failed to unlike tweet');
    }
  }

  Future<List<Tweet>> getRetweetedTweets() async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        return [
          Tweet(
            content: 'Retweeted tweet content',
            authorId: 3,
            media: [],
            likes: 20,
            retweets: 5,
          ),
        ]; // Return a list of retweeted tweets
      });
    } catch (e) {
      throw Exception('Failed to get retweeted tweets');
    }
  }

  Future<void> followUser(int targetUserId) async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        // Follow the user
      });
    } catch (e) {
      throw Exception('Failed to follow user');
    }
  }

  Future<void> unfollowUser(int targetUserId) async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        // Unfollow the user
      });
    } catch (e) {
      throw Exception('Failed to unfollow user');
    }
  }

  Future<List<User>> getFollowers() async {
    // Simulate network call
    try {
      return Future.delayed(Duration(seconds: 1), () {
        return [
          User(
            id: 4,
            name: 'Follower User',
            email: 'follower@example.com',
            password: 'password',
            profile: 'profile_url',
            jwtToken: '',
            followersCount: 10,
            followingCount: 20,
          ),
        ]; // Return a list of followers
      });
    } catch (e) {
      throw Exception('Failed to get followers');
    }
  }

  Future<List<User>> getFollowing() async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        return [
          User(
            id: 5,
            name: 'Following User',
            email: 'following@example.com',
            password: 'password',
            profile: 'profile_url',
            jwtToken: '',
            followersCount: 10,
            followingCount: 20,
          ),
        ]; // Return a list of following users
      });
    } catch (e) {
      throw Exception('Failed to get following users');
    }
  }

  Future<void> makeRetweet(Tweet tweet) async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        // Make a retweet
      });
    } catch (e) {
      throw Exception('Failed to make retweet');
    }
  }

  Future<void> retweet(Tweet tweet) async {
    try {
      // Simulate network call
      return Future.delayed(Duration(seconds: 1), () {
        // Retweet the tweet
      });
    } catch (e) {
      throw Exception('Failed to retweet');
    }
  }

  Future<void> likeTweet(Tweet tweet) async {
    // Simulate network call
    try {
      return Future.delayed(Duration(seconds: 1), () {
        // Like the tweet
      });
    } catch (e) {
      throw Exception('Failed to like tweet');
    }
  }

  Future<User?> getuserById(int id)async {
    // Simulate network call
    try {
      return Future.delayed(Duration(seconds: 1), () {
        // Like the tweet
      });
    } catch (e) {
      throw Exception('Failed to like tweet');
    }
  }
}
