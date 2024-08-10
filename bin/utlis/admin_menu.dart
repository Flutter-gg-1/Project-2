import 'dart:io';
import '../model/users/admin.dart';
import 'print_with_color.dart';

adminMenu() {
  Admin adminFunction = Admin();
  const instructure =
      '1| Add book'
      '\n2| Remove book'
      '\n3| Display book'
      '\n4| Display receipt record'
      '\n5| Add customor account';
  PrintWithColor.green(instructure);
  PrintWithColor.red('0| exit');
  PrintWithColor.green('\ninput : ');
  String input = stdin.readLineSync().toString().trim();
  PrintWithColor.blue('================================================== \n');
  switch (input) {
    case '1':
      adminFunction.addBook();
      break;
    case '2':
      adminFunction.removeBook();
      break;
    case '3':
      adminFunction.displayBook();
      break;
    case '4':
      adminFunction.displayReceipt();
      break;
    case '5':
      adminFunction.addCustomorAccount();
      break;
    case '0':
      break;
    default:
    PrintWithColor.red('Wrong input');
  }
}
