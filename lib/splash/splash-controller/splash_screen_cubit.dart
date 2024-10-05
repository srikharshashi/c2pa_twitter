// ignore_for_file: dead_code

import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  UserDetailsService userDetailsService;
  SplashScreenCubit(this.userDetailsService) : super(SplashScreenInitial());

  void checkUser() async {
    //check if user is authenticated
    //if authenticated emit SplashScreenAuthenticated
    //else emit SplashScreenUnauthenticated

    //simulate a delay
    await Future.delayed(Duration(seconds: 3));
    if (true) {
      emit(SplashScreenAuthenticated());
    // ignore: dead_code
    } else {
      emit(SplashScreenUnauthenticated());
    }
  }
}
