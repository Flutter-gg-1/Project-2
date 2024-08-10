import 'dart:io';

import 'package:project_2/database/json/library.dart';
import 'package:project_2/database/model/model.dart';

class UserPermissions {
  Library library = Library.fromJson(libraryBook);

  userInput() {
    print("Please enter your choice:");
    print("01. View books");
    print("02. Purchase book");
    print("03. View receipt");
    print("04. View purchased books");
    print("05. Sign out");

    int userChoice = int.parse(stdin.readLineSync()!);
    return userChoice;
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
      print("Price: ${book.price}");
    } else {
      print("Book not found");
    }
  }

  //Can view all books they have purchased.
  void viewPurchasedBooks() {
    print("View purchased books");
    for (var book in library.books) {
      if (book.quantity < 5) {
        print("Title: ${book.title}");
        print("Author: ${book.authors}");
        print("Category: ${book.categories}");
        print("Year: ${book.year}");
        print("Quantity: ${book.quantity}");
        print("Price: ${book.price}");
      }
    }
  }
}
