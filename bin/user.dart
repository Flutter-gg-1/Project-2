import 'dart:io';
import 'management.dart';
import 'package:project_2/database/json/library.dart';
import 'package:project_2/database/model/model.dart';

class UserPermissions {
  Library library = Library.fromJson(libraryBook);

  userInput() {
    int userChoice;
    do {
      print("Please enter your choice:");
      print("1. View books");
      print("2. Purchase book");
      print("3. View receipt");
      print("4. Sign out");
      print("5. Exit");
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
            print("Thank you for using the library system :D");
            print("Goodbye!");
            break;
          default:
            print("Invalid option");
        }
      } catch (e) {
        print("Error: $e");
        FormatException("Please enter a valid number");
      }
    } while (userChoice != 5);
  }

  //Can view all books.
  void viewBooks() {
    print("View books");
    for (var book in library.books) {
      print("Title: ${book.title}");
      print("Author: ${book.authors}");
      print("Category: ${book.categories}");
      print("Year: ${book.year}");
      print("Quantity: ${book.quantity}");
      print("Price: ${book.price}\n");
    }
  }

  //Can purchase books.
  void purchaseBook() {
    print("Purchase book");
    print("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      var book = library.books.firstWhere((element) => element.id == id);
      if (book.quantity > 0) {
        book.quantity--;
        print("Book purchased successfully");
      } else {
        print("Book out of stock");
      }
    } else {
      print("Book not found");
    }
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      }
    } catch (e) {
      print(e);
      return purchaseBook();
    }
  }

  //Can view the receipt for their purchases.
  void viewReceipt() {
    print("View receipt");
    print("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      var book = library.books.firstWhere((element) => element.id == id);
      print("Title: ${book.title}");
      print("Author: ${book.authors}");
      print("Category: ${book.categories}");
      print("Year: ${book.year}");
      print("Quantity: ${book.quantity}");
      print("Price: ${book.price}\n");
    } else {
      print("Book not found");
    }
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      }
    } catch (e) {
      print(e);
      return viewReceipt();
    }
  }
}
