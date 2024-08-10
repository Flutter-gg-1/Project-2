import 'dart:io';

import 'buy_book.dart';
import '../global_varbiels.dart';
import 'receipt.dart';

user(String usreName) {
  bool isExit = false;

  do {
    print("-------------------Welcome $usreName -------------------");
    print("Choose what you want to do:");
    print("1. Buy book");
    print("2. View the purchases receipt");
    print("q. Exit");
    String input = stdin.readLineSync()!;

    switch (input) {
      case "1":
        library.listAllLibrary();
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
    }
  } while (!isExit);
}
