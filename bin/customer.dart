import 'exit_method.dart';
import 'dart:io';
import 'opreations/customer_receipt.dart';
import 'opreations/buy_book.dart';

customer() {
  //variable
  bool isExit = false;
  //loop of admin opreation
  do {
    print("\n_______________Welcome to Customer System_______________\n");
    print("* Select what type of opreation do you want to perform:");
    print("0: buy a book");
    print("1: View receipt of purchases");
    print("Q: Exit");
    print("Enter your choice:");
    String? userInput = stdin.readLineSync();

    //error handling
    try {
      if (userInput!.isEmpty) {
        throw FormatException("X Empty input X");
      }

      switch (userInput) {
        //buy a Book
        case "0":
          print("Enter Book ID :");
          String bookId = stdin.readLineSync()!;
          print("Enter Customer ID :");
          int customerId = int.parse(stdin.readLineSync()!);
          print("Enter Book Quantity :");
          int bookQuantity = int.parse(stdin.readLineSync()!);
          buyBook(
              bookId: bookId,
              customerId: customerId,
              bookQuantity: bookQuantity);
          break;

        //View receipt of purchases by customer ID
        case "1":
          print("Enter Customer ID :");
          int customerId = int.parse(stdin.readLineSync()!);
          customerReceipt(customerId: customerId);
          break;

        //for exit
        case "Q" || "q":
          isExit = exitMethod();
          break;

        default:
          print("X Invalid choice please select choice from the list X");
      }
    } catch (e) {
      print("X Error: $e X");
    }

    //end loop
  } while (!isExit);
  print("See you later (:");
}
