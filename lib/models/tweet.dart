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
}