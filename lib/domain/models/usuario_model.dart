class UserModel {

  final String? id;
  final String email;
  final String name;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password
  });
}
