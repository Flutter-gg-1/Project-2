import 'dart:math';

import 'book.dart';

class User {
  int id = Random().nextInt(200);
  String name;
  int age;
  UserRole? userRole = UserRole.customer;

  List<Book> bookCollection = [];

  User({required this.name, required this.age, this.userRole});
}

enum UserRole { admin, customer }
