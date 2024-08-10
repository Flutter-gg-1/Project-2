import 'dart:io';

import '../function/admin_login.dart';
import 'customer_menu.dart';
import 'print_with_color.dart';

class Menu {
  mainMenu() {
    PrintWithColor.green('Welcome to our library📖\n chose your type :\n');
    const instructure = 
        '1| Admin 🧑‍💼'
        '\n2| Customer 🧑‍🏫';

    PrintWithColor.green(instructure);
    PrintWithColor.red('0|exit');
    PrintWithColor.green('\ninput : ');
    String input = stdin.readLineSync().toString();

    switch (input) {
      case '1':
        adminLogin();
        break;
      case '2':
        customerMenu();
        break;
      case '0':
        PrintWithColor.green('Good bye 😊');
        exit(0);
      default:
        PrintWithColor.red('⚠️  Wrong input');
    }
  }
}
