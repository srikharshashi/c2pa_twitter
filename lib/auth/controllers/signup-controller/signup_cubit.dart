import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:meta/meta.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';

import '../../../models/user.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthService _authService;
  UserDetailsService _userDetailsService;

  SignupCubit(this._authService,this._userDetailsService) : super(SignupInitial());

  void signup(String email, String password) async {
    emit(SignupLoading());
    await Future.delayed(Duration(seconds: 3));
    User? user ;
    try {
     user = await _authService.signup(email, password);
      if(user==null){
        emit(SignupFailure('Signup failed'));
      }else{
        emit(SignupSuccess(user.jwtToken, email));
        _userDetailsService.setUser(user);
      }
    } catch (e) {
      emit(SignupFailure('Signup failed'));
    }
  }
}