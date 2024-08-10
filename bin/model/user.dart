import 'book.dart';

class User {
  int id;
  String name;
  int age;
  UserRole userRole;

  List<Book> bookCollection = [];

  User(
      {required this.id,
      required this.name,
      required this.age,
      this.userRole = UserRole.customer});

  // Predefined users
  static var userList = [
    User(id: 0, name: 'Mozart', age: 30, userRole: UserRole.admin),
    User(id: 1, name: 'Chopin', age: 20),
    User(id: 2, name: 'Beethoven', age: 15),
    User(id: 3, name: 'Liszt', age: 35)
  ];
}

enum UserRole { admin, customer }
