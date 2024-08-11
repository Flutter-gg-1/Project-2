import 'dart:io';

import '../admin_functions/display_books.dart';
import 'buy_book.dart';
import 'receipt.dart';

//function user
user(String usreName) {
  bool isExit = false;

  do {
    //display list of functions to the admin to choose from
    print("-------------------Welcome $usreName -------------------");
    print("Choose what you want to do:");
    print("1. Buy book");
    print("2. View the purchases receipt");
    print("q. Exit");
    String input = stdin.readLineSync()!;

    switch (input) {
      case "1":
        listAllLibrary();
        print("\n Enter a book title you want to buy:");
        String title = stdin.readLineSync()!;
        buyBook(title);

        break;
      case "2":
        displayReceipts();
        break;

      case "q" || "Q":
        isExit = true;
        break;
      default:
        print("not a viled input");
    }
  } while (!isExit);
}
