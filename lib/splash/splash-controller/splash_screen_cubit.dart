import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  void checkUser() {
    //check if user is authenticated
    //if authenticated emit SplashScreenAuthenticated
    //else emit SplashScreenUnauthenticated

    //simulate a delay
    Future.delayed(Duration(seconds: 2));
    if (true) {
      emit(SplashScreenAuthenticated());
    // ignore: dead_code
    } else {
      emit(SplashScreenUnauthenticated());
    }

  }
 

}
