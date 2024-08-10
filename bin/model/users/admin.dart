import 'dart:io';

import '../../function/admin_function/add.dart';
import '../../function/admin_function/add_account.dart';
import '../../function/admin_function/receipt_displayer.dart';
import '../../function/admin_function/remove.dart';
import '../../function/display.dart';
import '../../utlis/menu.dart';
import '../../utlis/print_with_color.dart';

class Admin {
  Menu restart = Menu();
  static List receiptLog = [];
  void addBook() async {
    PrintWithColor.blue('=========Add Book=======');
    await add();
    stdin.readLineSync();
    restart.mainMenu();
    PrintWithColor.blue('========================');
  }

  void removeBook() async {
    PrintWithColor.blue('=========Remove Book=======');
    await remove();
    stdin.readLineSync();
    restart.mainMenu();
    PrintWithColor.blue('===========================');
  }

  void displayReceipt() async {
    PrintWithColor.blue('=========Receipt Records=======');
    await receiptDisplayer();
    stdin.readLineSync();
    restart.mainMenu();
    PrintWithColor.blue('===============================');
  }

  void displayBook() async {
    PrintWithColor.blue('=========================');
    await bookDisplayer();
    stdin.readLineSync();
    restart.mainMenu();
    PrintWithColor.blue('=========================');
  }

  void addCustomorAccount() {
    PrintWithColor.blue('=========Add Account=======');
    addAccount();
    PrintWithColor.blue('===========================');
  }
}
