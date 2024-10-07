import 'package:bloc/bloc.dart';
import 'package:c2pa_twitter/auth/services/auth-service.dart';
import 'package:c2pa_twitter/common/cache-helper.dart';
import 'package:c2pa_twitter/common/user-details.service.dart';
import 'package:c2pa_twitter/models/user.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthService authService;
  UserDetailsService userDetailsService;
  CacheHelperService cacheHelperService;
  LoginCubit(
      {required this.authService,
      required this.userDetailsService,
      required this.cacheHelperService})
      : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    // Call the login method from AuthService
    User? user = null;
    try {
      user = await authService.login(email, password);
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }

    if (user == null) {
      emit(LoginFailure('Invalid email or password'));
    } else {
      userDetailsService.setUser(user);
      cacheHelperService.setUser(user);
      emit(LoginSuccess(user.jwtToken, email));
    }
  }
}
