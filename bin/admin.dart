import 'dart:io';

import 'package:project_2/database/json/library.dart';
import 'package:project_2/database/model/model.dart';

class AdminPermissions {
  Library library = Library.fromJson(libraryBook);

  adminInput() {
    print("Please enter your choice:");
    print("1. Add book");
    print("2. Remove book");
    print("3. Update book");
    print("4. View receipt");
    print("5. View books");
    print("6. Sign out");
    int adminChoice = int.parse(stdin.readLineSync()!);
    return adminChoice;
  }

  //Can add books.
  void addBook() {
    print("Add book");
    print("Please enter the book id");
    String id = stdin.readLineSync()!;
    print("Please enter the book title");
    String title = stdin.readLineSync()!;
    print("Please enter the book author");
    String author = stdin.readLineSync()!;
    print("Please enter the book category");
    String category = stdin.readLineSync()!;
    print("Please enter the book year");
    int year = int.parse(stdin.readLineSync()!);
    print("Please enter the book quantity");
    int quantity = int.parse(stdin.readLineSync()!);
    print("Please enter the book price");
    double price = double.parse(stdin.readLineSync()!);
    if (library.books.any((element) => element.id == id)) {
      print("Book already exists");
    } else if (id == "") {
      print("Please enter the book title");
    } else if (title == "") {
      print("Please enter the book title");
    } else if (author == "") {
      print("Please enter the book author");
    } else if (category == "") {
      print("Please enter the book category");
    } else if (year == 0) {
      print("Please enter the book year");
    } else if (quantity == 0) {
      print("Please enter the book quantity");
    } else if (price == 0) {
      print("Please enter the book price");
    } else {
      library.books
          .add(Book(id, title, [author], [category], year, quantity, price));
      print("Book added successfully");
    }
  }

  //Can remove books.
  removeBook() {
    print("Remove book");
    print("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      library.books.removeWhere((element) => element.id == id);
      print("Book removed successfully");
    } else {
      print("Book not found");
    }
  }

  //Can update book details.
  updateBook() {
    print("Update book");
    print("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      print("Please enter the book title");
      String title = stdin.readLineSync()!;
      print("Please enter the book author");
      String author = stdin.readLineSync()!;
      print("Please enter the book category");
      String category = stdin.readLineSync()!;
      print("Please enter the book year");
      int year = int.parse(stdin.readLineSync()!);
      print("Please enter the book quantity");
      int quantity = int.parse(stdin.readLineSync()!);
      print("Please enter the book price");
      double price = double.parse(stdin.readLineSync()!);
      library.books.removeWhere((element) => element.id == id);
      library.books
          .add(Book(id, title, [author], [category], year, quantity, price));
      print("Book updated successfully");
    } else {
      print("Book not found");
    }
  }

  //Can view the receipt for purchases
  viewReceipt() {
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
}