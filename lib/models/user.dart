// write a user model which has id: int, name: String, email: String, and password: String , profile:String fields

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String profile;
  final String jwtToken;
  final int followersCount;
  final int followingCount;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profile,
    required this.jwtToken,
    required this.followersCount,
    required this.followingCount,
  });

  factory User.create({required Map<String, dynamic> data}) {
    return User(
      id: data['id'],
      name: data['userName'],
      email: data['email'],
      password: data['password'],
      profile: data['profile'] ?? "",
      jwtToken: data['token'],
      followersCount: data['followersCount'],
      followingCount: data['followingCount'],
    );
  }

  static toMap(User user) {
    final Map<String, dynamic> data = {
      'id': user.id,
      'userName': user.name,
      'email': user.email,
      'password': user.password,
      'profile': user.profile,
      'token': user.jwtToken,
      'followersCount': user.followersCount,
    };
    return data;
  }
}
