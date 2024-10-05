
import '../../models/user.dart';

class AuthService {
  // Method to validate email format
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  // Login method
  Future<User?> login(String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 3));
      return User(email: "dasojusrikhar@gmail.com", password:"123456", id: 1, name: "Srikhar", profile: "profile", jwtToken:"123456");
    } catch (e) {
      throw Exception('Login failed');
    }
  }

  // Signup method
  Future<User?> signup(String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 3));
      return User(email: email, password: password, id: 1, name: "Srikhar", profile: "profile", jwtToken:"123456");
    } catch (e) {
      throw Exception('Signup failed');
    }
  }
}