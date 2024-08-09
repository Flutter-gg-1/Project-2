import 'dart:io';
import 'admin.dart';
import 'print_with_color.dart';
import 'customer.dart';
void main(List<String> arguments) {
  printWithColor(text: "\n              Welcome to Library System \n", color: "Magenta");
  printWithColor(text: "     Please select if you are an admin or customer \n", color: "White");

  printWithColor(text: "(1) Admin", color: "Cyan");
  printWithColor(text: "(2) customer", color: "Cyan");
  printWithColor(text: "\n~~~~~~~~~~Please select a number~~~~~~~~~~~~~~\n", color: "Magenta");

  int input = int.parse(stdin.readLineSync()!);

  switch(input){
    case 1:
    admin();
    break;
    case 2:
    customer();
    break;

    default:
      printWithColor(text: "\nPlease select a number", color: "Magenta");

  }
}
