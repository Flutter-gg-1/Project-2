import 'dart:io';
import '../model/users/customer.dart';
import 'print_with_color.dart';

customerMenu() {
  Customer customorFunction = Customer();
  const instructure =
      '1| Buy a book 📚'
      '\n2| Show book list 📖';

  PrintWithColor.green(instructure);
  PrintWithColor.red('0|exit');
  PrintWithColor.green('\ninput : ');
  String input = stdin.readLineSync().toString().trim();
  PrintWithColor.blue('================================================== \n');
  switch (input) {
    case '1':
    customorFunction.buyABook();
      break;
    case '2':
    customorFunction.showBookList();
      break;
    case '0':
      break;
    default:
    PrintWithColor.red('⚠️Wrong input');
  }
}
