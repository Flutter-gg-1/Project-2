import 'dart:io';
import '../model/library.dart';
import '../utils/filemngmt.dart';
import '../model/user/user.dart';
import '../model/user/customer.dart';
import '../screens/menu.dart';
import '../utils/login.dart';
import 'package:ansicolor/ansicolor.dart';

AnsiPen color = AnsiPen()..rgb(r: 1, g: 0.576, b: 0);
AnsiPen highlight = AnsiPen()..rgb(r: 0.247, g: 0.318, b: 0.478, bg: true);
AnsiPen gold = AnsiPen()..rgb(r: 0.7, g: 0.7, b: 0.25);
AnsiPen cyan = AnsiPen()..cyan(bold: true);
AnsiPen green = AnsiPen()..green(bold: true);
AnsiPen yellow = AnsiPen()..yellow(bold: true);
AnsiPen blue = AnsiPen()..blue(bold: true);
AnsiPen red = AnsiPen()..red(bold: true); 

void main(List<String> arguments) async {
  Library lib = Library([]);
  await readFile(lib.books, User.usersList);
  String? choice = '';

  print(highlight(gold('\n---- Welcome to the Library ----')));

  whileLoop:
  while (true) {
    print(yellow('\n1- Register'));
    print(yellow('2- Login'));
    print(yellow('0- Exit'));

    stdout.write(cyan('\nEnter your choice: '));
    choice = stdin.readLineSync();

    switch (choice) {
      case '1':
       try {
      Customer.addNewCustomer();
    } catch (e) {
      print(red(e));
      continue;
    }
      menu(lib, await login());
      case '2':
      menu(lib, await login());
      case '0':
      break whileLoop;
      default:
      print(red('Invalid Choice!!'));
    }
  }
}
