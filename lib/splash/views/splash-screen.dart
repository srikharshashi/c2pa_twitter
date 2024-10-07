import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:c2pa_twitter/splash/splash-controller/splash_screen_cubit.dart';

import '../../routing/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Call checkUser when the widget is initialized
    context.read<SplashScreenCubit>().checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        builder: (context, state) {
          if (state is SplashScreenInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://logodownload.org/wp-content/uploads/2014/09/twitter-logo-11.png'), // Replace with your logo asset
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is SplashScreenAuthenticated) {
            // Navigate to homepage
            return Container(); // Return an empty container while navigating
          } else if (state is SplashScreenUnauthenticated) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.LOGIN);
                    },
                    child: Text('Log In'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.SIGNUP);
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            );
          }
          return Container(); // Default case
        }, listener: (BuildContext context, SplashScreenState state) { 
          if(state is SplashScreenAuthenticated){
            Navigator.of(context).pushReplacementNamed(Routes.HOME);
          }
         },
      ),
    );
  }
}