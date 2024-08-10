class User {
  String id;
  String firstName;
  String lastName;
  String password = '';
  static List<User> usersList = [];

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password']);
  }

  toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'password': password
    };
  }
}
