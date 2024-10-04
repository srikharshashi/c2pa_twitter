
class AuthService {
  // Dummy user database
  final Map<String, String> _users = {};

  // Method to validate email format
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  // Method to generate JWT token (dummy implementation)
  String _generateJwt(String email) {
    return "abcd";
  }

  // Login method
  String login(String email, String password) {
    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }
    if (_users.containsKey(email) && _users[email] == password) {
      return _generateJwt(email);
    } else {
      throw Exception('Invalid email or password');
    }
  }

  // Signup method
  String signup(String email, String password) {
    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }
    if (_users.containsKey(email)) {
      throw Exception('Email already exists');
    }
    _users[email] = password;
    return _generateJwt(email);
  }
}