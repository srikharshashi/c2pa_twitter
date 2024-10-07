// write a user model which has id: int, name: String, email: String, and password: String , profile:String fields

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String profile;
  final String jwtToken;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profile,
    required this.jwtToken,
  });

  factory User.create({
    required int id,
    required String name,
    required String email,
    required String password,
    String? profile,
    String? jwtToken,
  }) {
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      profile: profile ?? '',
      jwtToken: jwtToken ?? '',
    );
  }
}
