
import '../../common/constants.dart';
import '../../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {

  // Login method
  Future<User?> login(String email, String password) async {
    final url = Uri.parse(Constants.BASE_SERVER_URL+'/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(responseBody);
        return User.create(data : responseBody);
      } else {
        throw Exception('Login failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Signup method
  Future<User?> signup(String email, String password, String userName, String profile) async {
    final url = Uri.parse(Constants.BASE_SERVER_URL + '/auth/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'userName': userName,
          'profile': profile,
        }),
      );
      print(response.toString());
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return User.create(data: responseBody);
      } else {
        throw Exception('Signup failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
  }
}