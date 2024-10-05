import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:c2pa_twitter/models/user.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthService authService ;
  UserDetailsService userDetailsService;
  LoginCubit(this.authService,this.userDetailsService) : super(LoginInitial());

  void login(String email, String password) async{
    emit(LoginLoading());
    // Call the login method from AuthService
    User? user;
    try {
      user = await authService.login(email, password);
    } catch (e) {
      emit(LoginFailure('Invalid email or password'));
    }
    
    //simulate a delay
    Future.delayed(Duration(seconds: 2));
    if(user==null){
      emit(LoginFailure('Invalid email or password'));
    }else{
      userDetailsService.setUser(user);
      emit(LoginSuccess(user.jwtToken, email));
    }
  }
}
