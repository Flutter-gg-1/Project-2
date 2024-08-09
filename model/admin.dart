import 'user.dart';

class Admin extends User {
  Admin(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.password});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'password': password
    };
  }
}
