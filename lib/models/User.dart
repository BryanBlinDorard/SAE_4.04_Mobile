class User {
  int id;
  String name;
  String email;
  String password;

  User({required this.id, required this.name, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password}';
  }
}