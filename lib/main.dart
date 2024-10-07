import 'package:c2pa_twitter/auth/controllers/login-controller/login_cubit.dart';
import 'package:c2pa_twitter/auth/controllers/signup-controller/signup_cubit.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';
import 'package:c2pa_twitter/common/cache-helper.dart';
import 'package:c2pa_twitter/common/tweet-helper.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:c2pa_twitter/home/controllers/home-controller/home_cubit.dart';
import 'package:c2pa_twitter/home/controllers/profile-tweets-cubit/profile_tweets_cubit.dart';
import 'package:c2pa_twitter/routing/router.dart';
import 'package:c2pa_twitter/splash/splash-controller/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final AuthService _authService = AuthService();
  final UserDetailsService _userDetailsService = UserDetailsService();
  final TweetHelperService _tweetHelperService = TweetHelperService();
  final CacheHelperService _cacheHelperService = CacheHelperService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LoginCubit(
                  authService: _authService,
                  userDetailsService: _userDetailsService,
                  cacheHelperService: _cacheHelperService)),
          BlocProvider(
              create: (context) => SignupCubit(
                  authService: _authService,
                  userDetailsService: _userDetailsService,
                  cacheHelperService: _cacheHelperService)),
          BlocProvider(
              create: (context) =>
                  HomeCubit(_tweetHelperService, _userDetailsService)),
          BlocProvider(
              create: (context) => SplashScreenCubit(
                  userDetailsService: _userDetailsService,
                  cacheHelperService: _cacheHelperService)),
          BlocProvider(
              create: (context) =>
                  ProfileTweetsCubit(tweetHelperService: _tweetHelperService))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false, // remove debug banner
          title: 'C2PA Twitter',
          onGenerateRoute: _appRouter.onGenerateRoute,
        ));
  }
}