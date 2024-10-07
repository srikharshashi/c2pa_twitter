
import '../models/user.dart';

class UserDetailsService {
  //temporary fix
  User? _user =null;
  
  void resetUser(){
    _user = null;
  }

  // Fetch user details
  User? getUser() {
    return _user;
  }

  // Set user details
  void setUser(User user) {
    _user = user;
  }

  // Update user details
  void updateUser(User updatedUser) {
    if (_user != null && _user!.id == updatedUser.id) {
      _user = updatedUser;
    }
  }

  // Delete user details
  void deleteUser() {
    _user = null;
  }

  
  
}