import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthService authService ;
  UserDetailsService userDetailsService;
  LoginCubit(this.authService,this.userDetailsService) : super(LoginInitial());

  void login(String email, String password) async{
    emit(LoginLoading());
    // Call the login method from AuthService
    final jwt = authService.login(email, password);
    //simulate a delay
    Future.delayed(Duration(seconds: 2));
    if(jwt.isEmpty){
      emit(LoginFailure('Invalid email or password'));
    }else{
      emit(LoginSuccess(jwt, email));
      userDetailsService.userName="Shashi";
      userDetailsService.email=email;
    }
  }
}
