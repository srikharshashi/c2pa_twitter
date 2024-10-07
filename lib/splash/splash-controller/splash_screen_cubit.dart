// ignore_for_file: dead_code

import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/common/cache-helper.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:c2pa_twitter/models/user.dart';
import 'package:meta/meta.dart';


part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  UserDetailsService userDetailsService;
  CacheHelperService cacheHelperService;
  SplashScreenCubit(
      {required this.userDetailsService, required this.cacheHelperService})
      : super(SplashScreenInitial());

  void checkUser() async {
   await cacheHelperService.initalize();
    print("Checking user");
    try {
      var useExists = cacheHelperService.doesUserExist();
      print(useExists);
      if(useExists){
        User? user = cacheHelperService.getUser();
        print(user);
        if(user!=null){
          userDetailsService.setUser(user);
          print("User exists");
          emit(SplashScreenAuthenticated());
        }else{
          print("User does not exist");
          emit(SplashScreenUnauthenticated());
        }
      }else{
        print("User does not exist");
        emit(SplashScreenUnauthenticated());
      }
    } catch (e) {
      print(e.toString());
      emit(SplashScreenUnauthenticated());
    }
  }
}
