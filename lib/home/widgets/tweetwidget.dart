import 'package:flutter/material.dart';

class TweetWidget extends StatelessWidget {
  final String username;
  final String profilePictureUrl;
  final String tweetContent;
  final VoidCallback onLikePressed;
  final VoidCallback onRetweetPressed;

  const TweetWidget({
    Key? key,
    required this.username,
    required this.profilePictureUrl,
    required this.tweetContent,
    required this.onLikePressed,
    required this.onRetweetPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profilePictureUrl),
                ),
                SizedBox(width: 8.0),
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(tweetContent),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: onLikePressed,
                ),
                IconButton(
                  icon: Icon(Icons.repeat),
                  onPressed: onRetweetPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}