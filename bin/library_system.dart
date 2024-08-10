import 'dart:io';
import 'admin.dart';
import 'customer.dart';
import 'exit_method.dart';
import 'color_print.dart/print_with_colors.dart';

void main() {
  //variable
  bool isExit = false;
  //loop of opreation
  do {
    print("\n\n\n\n\n");
    printWithColor(
        text: " _____________________________________________________ ",
        color: "Magenta");
    printWithColor(
        text: "|                                                     |",
        color: "Magenta");
    printWithColor(
        text: "|              Welcome to Library System              |",
        color: "Magenta");
    printWithColor(
        text: "|                                                     |",
        color: "Magenta");
    printWithColor(
        text: "|_____________________________________________________|",
        color: "Magenta");

    printWithColor(text: "\n\n * Select user type:", color: "Blue");
    printWithColor(text: "0: Admin", color: "Blue");
    printWithColor(text: "1: Customer", color: "Blue");
    printWithColor(text: "Q: Exit", color: "Blue");
    printWithColor(text: "\n Enter your choice:", color: "Blue");
    String? userInput = stdin.readLineSync();
    //error handling
    try {
      if (userInput!.isEmpty) {
        throw FormatException("X Empty input X");
      }

      switch (userInput) {
        //go to admin function
        case "0":
          admin();
          break;

        //go to customer function
        case "1":
          customer();
          break;

        //for exit
        case "Q" || "q":
          isExit = exitMethod();
          break;

        default:
          printWithColor(
              text: "X Invalid choice please select choice from the list X",
              color: "Red");
      }
    } catch (e) {
      printWithColor(text: "X Error: $e X", color: "Red");
    }

    //end loop
  } while (!isExit);
  printWithColor(text: "See you later (:", color: "Magenta");
}
