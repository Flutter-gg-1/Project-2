import 'dart:io';
import 'package:library_system/models/user.dart';

// function to get customer ID
int getId({required String? id, required List<User> users}) {
  while (id == null ||
      int.tryParse(id) == null ||
      users.map((user) => user.userId).toList().contains(int.parse(id)) ==
          false) {
    if (id == '0') {
      return 0;
    }
    print("ERROR : Invalid Customer ID ❌\n");
    print("Enter 0 to go BACK");
    stdout.write("Enter customer id : ");
    id = stdin.readLineSync();
  }
  return int.parse(id);
}
