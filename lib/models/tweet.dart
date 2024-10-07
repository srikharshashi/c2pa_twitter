import 'dart:math';

class Tweet {
  final String content;
  final int authorId;
  final List<String> media;
  final int likes;
  final int retweets;

  Tweet({
    required this.content,
    required this.authorId,
    required this.media,
    required this.likes,
    required this.retweets,
  });

  factory Tweet.create({required Map<String, dynamic> data}) {
    return Tweet(
      content: data['content'],
      authorId: data['authorId'],
      media: data['media'].map((e) => e.toString()).toList(),
      likes: data['likes'],
      retweets: data['retweets'],
    );
  }

  static toMap(Tweet tweet) {
    final Map<String, dynamic> data = {
      'content': tweet.content,
      'authorId': tweet.authorId,
      'media': tweet.media,
      'likes': tweet.likes,
      'retweets': tweet.retweets,
    };
    return data;
  }
}
