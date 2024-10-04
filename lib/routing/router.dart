import 'package:c2pa_twitter/auth/views/login-page.dart';
import 'package:c2pa_twitter/auth/views/signup-page.dart';
import 'package:c2pa_twitter/home/views/homepage.dart';
import 'package:c2pa_twitter/splash/views/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:c2pa_twitter/routing/routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.LOGIN:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Routes.SIGNUP:
        return MaterialPageRoute(builder: (context) => SignupPage());
      case Routes.HOME:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return null;
    }
  }
}