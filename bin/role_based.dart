import 'dart:io';
import 'print_with_color.dart';
import 'admin.dart';
import 'customer.dart';

rolebased() {
  printWithColor(
      text: "\n              Welcome to Library System \n", color: "Magenta");
  printWithColor(
      text: "     Please select if you are an admin or customer \n",
      color: "White");

  printWithColor(text: "(1) Admin", color: "Cyan");
  printWithColor(text: "(2) customer", color: "Cyan");
  printWithColor(
      text: "\n~~~~~~~~~~Please select a number~~~~~~~~~~~~~~\n",
      color: "Magenta");
  int? input;
  try {
    input = int.parse(stdin.readLineSync()!);
  } catch (error) {
    printWithColor(text: "A number must be entered.", color: "Red");
    print(error);
    printWithColor(
        text: "\nTo return back to the main features press (Enter)\n",
        color: "Black");
    stdin.readLineSync();
    rolebased();
  }

  switch (input) {
    case 1:
      admin();
      break;
    case 2:
      customer();
      break;

    default:
    printWithColor(text: "\nPlease press (Enter) and select one of number from list", color: "Red");
    stdin.readLineSync();
    rolebased();
  }
}
