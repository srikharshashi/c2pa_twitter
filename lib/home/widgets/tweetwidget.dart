import 'package:flutter/material.dart';

import '../../models/tweet.dart';
import '../../models/user.dart';

class TweetWidget extends StatefulWidget {
  final Tweet tweet;
  final User author;
  final VoidCallback onLike;
  final VoidCallback onRetweet;

  TweetWidget({
    required this.tweet,
    required this.author,
    required this.onLike,
    required this.onRetweet,
  });

  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  bool isLiked = false;
  bool isRetweeted = false;

  void handleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.onLike();
  }

  void handleRetweet() {
    setState(() {
      isRetweeted = !isRetweeted;
    });
    widget.onRetweet();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(width: 10),
                Text(
                  widget.author.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(widget.tweet.content),
            SizedBox(height: 10),
            if (widget.tweet.media.isNotEmpty)
              Center(
                child: Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.tweet.media.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.network(widget.tweet.media[index]),
                      );
                    },
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: isLiked ? Colors.purple[400] : Colors.grey,
                      ),
                      onPressed: handleLike,
                    ),
                    Text(
                        '${isLiked ? widget.tweet.likes + 1 : widget.tweet.likes}'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.repeat,
                        color: isRetweeted ? Colors.purple[400] : Colors.grey,
                      ),
                      onPressed: handleRetweet,
                    ),
                    Text(
                        '${isRetweeted ? widget.tweet.retweets + 1 : widget.tweet.retweets}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
