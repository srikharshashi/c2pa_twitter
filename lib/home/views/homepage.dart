import 'package:c2pa_twitter/home/controllers/home-controller/home_cubit.dart';
import 'package:c2pa_twitter/home/views/home-view.dart';
import 'package:c2pa_twitter/home/views/profile-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../models/user.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int badge = 0;
  final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  double gap = 10;

  PageController controller = PageController();

  getScreen(int position) {
    if (position == 0) {
      return HomeView();
    } else if (position == 1) {
      return Container(
        child: Center(
          child: Text('Liked Tweets'),
        ),
      );
    } else {
      return ProfilePage(
        user: User(
            id: 10,
            name: "Shashi",
            email: "shashi@123.com",
            password: "",
            followersCount: 10,
            followingCount: 20,
            profile:
                "https://sooxt98.space/content/images/size/w100/2019/01/profile.png",
            jwtToken: ""),
        tweets: context.read<HomeCubit>().tweets_temp,
        onFollow: () {},
      );
    }
  }

  @override
  void initState() {
    context.read<HomeCubit>().getTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            LineIcons.twitter,
            size: 30,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  print('Logout');
                },
                icon: Icon(Icons.power_off))
          ],
        ),
        body: PageView.builder(
            onPageChanged: (page) {
              setState(() {
                selectedIndex = page;
                badge = badge + 1;
              });
            },
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, position) {
              return getScreen(position);
            }),
        bottomNavigationBar: SafeArea(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -10,
                      blurRadius: 60,
                      color: Colors.black.withOpacity(.4),
                      offset: Offset(0, 25),
                    )
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3.0, vertical: 3),
                    child: GNav(
                        tabs: [
                          GButton(
                            gap: gap,
                            iconActiveColor: Colors.purple,
                            iconColor: Colors.black,
                            textColor: Colors.purple,
                            backgroundColor: Colors.purple.withOpacity(.2),
                            iconSize: 24,
                            padding: padding,
                            icon: LineIcons.home,
                            text: 'Home',
                          ),
                          GButton(
                            gap: gap,
                            iconActiveColor: Colors.pink,
                            iconColor: Colors.black,
                            textColor: Colors.pink,
                            backgroundColor: Colors.pink.withOpacity(.2),
                            iconSize: 24,
                            padding: padding,
                            icon: LineIcons.heart,
                          ),
                          // GButton(
                          //   gap: gap,
                          //   iconActiveColor: Colors.amber[600],
                          //   iconColor: Colors.black,
                          //   textColor: Colors.amber[600],
                          //   backgroundColor: Colors.amber[600]!.withOpacity(.2),
                          //   iconSize: 24,
                          //   padding: padding,
                          //   icon: LineIcons.search,
                          //   text: 'Search',
                          // ),
                          GButton(
                            gap: gap,
                            iconActiveColor: Colors.teal,
                            iconColor: Colors.black,
                            textColor: Colors.teal,
                            backgroundColor: Colors.teal.withOpacity(.2),
                            iconSize: 24,
                            padding: padding,
                            icon: LineIcons.user,
                            leading: CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
                              ),
                            ),
                            text: context
                                        .read<HomeCubit>()
                                        .userDetailsService
                                        .getUser() !=
                                    null
                                ? context
                                    .read<HomeCubit>()
                                    .userDetailsService
                                    .getUser()!
                                    .name
                                : "Shashi",
                          )
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                          controller.jumpToPage(index);
                        })))));
  }
}
