import 'exit_method.dart';
import 'dart:io';
import 'opreations/customer_receipt.dart';
import 'opreations/buy_book.dart';
import 'color_print.dart/print_with_colors.dart';

customer() {
  //variable
  bool isExit = false;
  //loop of admin opreation
  do {
    printWithColor(
        text: "\n_______________Welcome to Customer System_______________\n",
        color: "Magenta");
    printWithColor(
        text: "* Select what type of opreation do you want to perform:",
        color: "Blue");
    printWithColor(text: "0: buy a book", color: "Blue");
    printWithColor(text: "1: View receipt of purchases", color: "Blue");
    printWithColor(text: "Q: Exit", color: "Blue");
    printWithColor(text: "Enter your choice:", color: "Blue");
    String? userInput = stdin.readLineSync();

    //error handling
    try {
      if (userInput!.isEmpty) {
        throw FormatException("X Empty input X");
      }

      switch (userInput) {
        //buy a Book
        case "0":
          printWithColor(text: "Enter Book ID :", color: "Blue");
          String bookId = stdin.readLineSync()!;
          printWithColor(text: "Enter Customer ID :", color: "Blue");
          int customerId = int.parse(stdin.readLineSync()!);
          printWithColor(text: "Enter Book Quantity :", color: "Blue");
          int bookQuantity = int.parse(stdin.readLineSync()!);
          buyBook(
              bookId: bookId,
              customerId: customerId,
              bookQuantity: bookQuantity);
          break;

        //View receipt of purchases by customer ID
        case "1":
          printWithColor(text: "Enter Customer ID :", color: "Blue");
          int customerId = int.parse(stdin.readLineSync()!);
          customerReceipt(customerId: customerId);
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
