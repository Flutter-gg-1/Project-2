import 'dart:io';

import '../../function/customer_function/buy.dart';
import '../../function/display.dart';
import '../../utlis/menu.dart';
import '../../utlis/print_with_color.dart';

class Customer {
  Menu restart = Menu();
  buyABook() async {
    PrintWithColor.blue('==========Welcome===========');
    await buy();
    stdin.readLineSync();
    restart.mainMenu();
    PrintWithColor.blue('===========================');
  }

  showBookList() async {
    PrintWithColor.blue('==========Welcom===========');
    await bookDisplayer();
    stdin.readLineSync();
    restart.mainMenu();
    PrintWithColor.blue('===========================');
  }
}
