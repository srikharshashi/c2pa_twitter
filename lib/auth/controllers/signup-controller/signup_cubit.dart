import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/common/cache-helper.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:meta/meta.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';

import '../../../models/user.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthService authService;
  UserDetailsService userDetailsService;
  CacheHelperService cacheHelperService;

  SignupCubit({required this.authService,required this.userDetailsService,required this.cacheHelperService}) : super(SignupInitial());

  void signup(String email, String password,String userName) async {
    User? user =null;
    emit(SignupLoading());
    try {
     user = await authService.signup(email, password,userName,"");
      if(user==null){
        emit(SignupFailure('Signup failed'));
      }else{
        userDetailsService.setUser(user);
        cacheHelperService.setUser(user);
        emit(SignupSuccess(user.jwtToken, email));
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}