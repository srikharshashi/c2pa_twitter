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

  factory Tweet.create(
      {required String content, required int authorId, List<String>? media}) {
    return Tweet(
      content: content,
      authorId: authorId,
      media: media ?? [],
      likes: 0,
      retweets: 0,
    );
  }
}
