class UserDetailsService {
  String _userName;
  String _displayPictureUrl;
  String _email;

  // Constructor
  UserDetailsService(this._userName, this._displayPictureUrl, this._email);

  // Getter for user name
  String get userName => _userName;

  // Setter for user name
  set userName(String userName) {
    _userName = userName;
  }

  // Getter for display picture URL
  String get displayPictureUrl => _displayPictureUrl;

  // Setter for display picture URL
  set displayPictureUrl(String displayPictureUrl) {
    _displayPictureUrl = displayPictureUrl;
  }

  // Getter for email
  String get email => _email;

  // Setter for email
  set email(String email) {
    _email = email;
  }
}