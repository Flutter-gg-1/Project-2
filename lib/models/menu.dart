// function to print menu based on mode
import 'package:library_system/models/customer.dart';

void menu({required String mode, Customer? customer}) {
  if (mode == 'guest') {
    print('-' * 30);
    print("| Welcome To Yaser's Library |");
    print('-' * 30);
    print('| 1 |         Sign in        |');
    print('-' * 30);
    print('| 2 |         Sign up        |');
    print('-' * 30);
    print('| 3 |      Enter as Admin    |');
    print('-' * 30);
    print('| 0 |           EXIT         |');
    print('-' * 30);
  }
  if(mode == 'customer') {
    print("Hello ${customer!.name}, Your balance is ${customer.balance} SR");
    print('-' * 32);
    print('| 1 |   Display library books  |');
    print('-' * 32);
    print('| 2 |         Buy a book       |');
    print('-' * 32);
    print('| 3 |        View receipts     |');
    print('-' * 32);
    print('| 0 |          Sign Out        |');
    print('-' * 32);
  }
  if(mode == 'admin') {
    print('1 -> display library books');
    print('2 -> add a book to library');
    print('3 -> remove a book from library');
    print('0 -> EXIT');
  }
}
