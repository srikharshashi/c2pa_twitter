import 'package:flutter/material.dart';
import '../../models/tweet.dart';
import '../../models/user.dart';
import '../widgets/tweetwidget.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  final List<Tweet> tweets;
  final bool isOwnProfile; // Check if this is the user's own profile
  final VoidCallback onFollow; // Callback when follow button is pressed

  ProfilePage({
    required this.user,
    required this.tweets,
    this.isOwnProfile = false, // Default value false for others' profiles
    required this.onFollow,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
    widget.onFollow(); // Execute the callback when the button is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            Divider(thickness: 2, color: Colors.grey[300]),
            _buildTweetList(),
          ],
        ),
      ),
    );
  }

  // Build the profile header
  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(widget.user.profile), // Profile picture
          ),
          SizedBox(height: 10),
          Text(
            widget.user.name,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            '@${widget.user.email}', // Could be username or any other info
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 5),
          Text(
            '600 Following 225 Followers', // Hardcoded, modify as needed
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.link, color: Colors.blue),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  // Handle opening the GitHub link, modify as per need
                },
                child: Text(
                  'github.com/sr...shashi',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          if (!widget.isOwnProfile) // Show follow button if it's not the user's own profile
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: toggleFollow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing ? Colors.grey : Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Text(
                  isFollowing ? "Following" : "Follow",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Build the list of tweets using TweetWidget
  Widget _buildTweetList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.tweets.length,
      itemBuilder: (context, index) {
        final tweet = widget.tweets[index];
        return TweetWidget(
          tweet: tweet,
          author: widget.user, // Assuming user is the author of all tweets
          onLike: () {
            // Handle like logic here
            print('Liked tweet: ${tweet.content}');
          },
          onRetweet: () {
            // Handle retweet logic here
            print('Retweeted tweet: ${tweet.content}');
          },
        );
      },
    );
  }
}
