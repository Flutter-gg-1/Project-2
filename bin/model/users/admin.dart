import 'dart:io';
import '../../function/admin_function/add.dart';
import '../../function/admin_function/add_account.dart';
import '../../function/admin_function/receipt_displayer.dart';
import '../../function/admin_function/remove.dart';
import '../../function/display.dart';
import '../../utlis/print_with_color.dart';
import '../library_data.dart';

class Admin {
  static List receiptLog = [];
  void addBook() {
    PrintWithColor.blue('=========Add Book=======');
     add();
    PrintWithColor.blue('========================');
  }

  void removeBook() {
    PrintWithColor.blue('=========Remove Book=======');
    remove();
    PrintWithColor.blue('===========================');
  }

  void displayReceipt() {
    PrintWithColor.blue('=========Receipt Records=======');
    receiptDisplayer();
    PrintWithColor.blue('===============================');
  }

  void displayBook() {
    PrintWithColor.blue('=========================');
    bookDisplayer();
    PrintWithColor.blue('=========================');
  }

  void addCustomorAccount() {
    PrintWithColor.blue('=========Add Account=======');
     addAccount();
    PrintWithColor.blue('===========================');
  }
}
