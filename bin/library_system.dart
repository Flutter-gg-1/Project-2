import 'dart:io';
import '../model/library.dart';
import '../utils/filemngmt.dart';
import '../model/user/user.dart';
import '../model/user/customer.dart';
import '../screens/menu.dart';
import '../utils/login.dart';

void main(List<String> arguments) async {
  Library lib = Library([]);
  await readFile(lib.books, User.usersList);
  String? choice = '';

  whileLoop:
  while (true) {
    print('\n1- Register');
    print('2- Login');
    print('0- Exit');

    stdout.write('\nEnter your choice: ');
    choice = stdin.readLineSync();

    switch (choice) {
      case '1':
      Customer.addNewCustomer();
      menu(lib, await login());
      case '2':
      menu(lib, await login());
      case '0':
      break whileLoop;
      default:
      print('Invalid Choice!!');
    }
  }
}
