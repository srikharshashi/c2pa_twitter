import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthService _authService;

  SignupCubit(this._authService) : super(SignupInitial());

  void signup(String email, String password) async {
    emit(SignupLoading());
    await Future.delayed(Duration(seconds: 3));
    try {
      var jwt = _authService.signup(email, password);
      emit(SignupSuccess(jwt,"Shashi"));
    } catch (e) {
      emit(SignupFailure('Signup failed'));
    }
  }
}