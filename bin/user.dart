import 'dart:io';
import 'management.dart';
import 'package:project_2/database/json/library.dart';
import 'package:project_2/database/model/model.dart';
import '../lib/helpers/color_print.dart';

class UserPermissions {
  Library library = Library.fromJson(libraryBook);
  List<Book> purchasedBooks = [];

  void userInput() {
    bool isExit = false;
    int userChoice;
    do {
      print("Please enter your choice:");
      printInfo("1. View books");
      printInfo("2. Purchase book");
      printInfo("3. View receipt");
      printError("4. Sign out");
      printError("5. Exit");
      stdout.write("Enter your choice: ");

      userChoice = int.parse(stdin.readLineSync()!);
      try {
        switch (userChoice) {
          case 1:
            viewBooks();
            break;
          case 2:
            purchaseBook();
            break;
          case 3:
            viewReceipt();
            break;
          case 4:
            Accounts().signOut();
            break;
          case 5:
            printSuccess("Thank you for using the library system :D");
            printSuccess("Goodbye!");
            isExit = true;
            break;
          default:
            printWarning("Invalid option");
        }
      } catch (e) {
        printError("Error: $e");
        FormatException("Please enter a valid number");
      }
    } while (!isExit);
  }

  // Can view all books.
  void viewBooks() {
    printInfo("View books");
    for (var book in library.books) {
      printGray("ID: ${book.id}");
      printGray("Title: ${book.title}");
      printGray("Author: ${book.authors}");
      printGray("Category: ${book.categories}");
      printGray("Year: ${book.year}");
      printGray("Quantity: ${book.quantity}");
      printGray("Price: ${book.price}\n");
    }
  }

  // Can purchase books.
  void purchaseBook() {
    printInfo("Purchase book");
    printInfo("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      var book = library.books.firstWhere((element) => element.id == id);
      if (book.quantity > 0) {
        book.quantity--;
        purchasedBooks.add(book);
        printSuccess("Book purchased successfully");
      }
    } else {
      printWarning("Book not found");
    }
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      }
    } catch (e) {
      printError(e);
      return purchaseBook();
    }
  }

  // Can view the receipt for their purchases.
  void viewReceipt() {
    printInfo("View receipt");
    if (purchasedBooks.isEmpty) {
      printWarning("No purchases made yet.");
    } else {
      for (var book in purchasedBooks) {
        printGray("Title: ${book.title}");
        printGray("Author: ${book.authors}");
        printGray("Category: ${book.categories}");
        printGray("Year: ${book.year}");
        printGray("Price: ${book.price}\n");
      }
    }
  }
}
