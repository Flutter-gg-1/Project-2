import 'dart:io';
import 'dart:math';
import 'management.dart';
import 'package:project_2/database/json/library.dart';
import 'package:project_2/database/model/model.dart';

class AdminPermissions {
  Library library = Library.fromJson(libraryBook);

  adminInput() {
    int adminChoice;
    do {
      print("Please enter your choice:");
      print("1. Add book");
      print("2. Remove book");
      print("3. Update book");
      print("4. View receipt");
      print("5. View books");
      print("6. Sign out");
      print("7. Exit");
      stdout.write("Enter your choice: ");
      adminChoice = int.parse(stdin.readLineSync()!);

      switch (adminChoice) {
        case 1:
          addBook();
          break;
        case 2:
          removeBook();
          break;
        case 3:
          updateBook();
          break;
        case 4:
          viewReceipt();
          break;
        case 5:
          viewBooks();
          break;
        case 6:
          Accounts().signOut();
          break;
        case 7:
          print("Thank you for using the library system :D");
          print("Goodbye!");
          break;
        default:
          print("Invalid option");
      }
    } while (adminChoice != 7);
  }

  //Can add books.
  void addBook() {
    print("Add book");
    print("Please enter the book id:");
    String id = stdin.readLineSync()!;
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      } else if (library.books.any((element) => element.id == id)) {
        print("Book already exists\n");
        return addBook();
      }
    } catch (e) {
      print(e);
      return addBook();
    }
    print("Please enter the book title:");
    String title = stdin.readLineSync()!;
    try {
      if (title == "") {
        throw Exception("Please enter the book title");
      }
    } catch (e) {
      print(e);
      return addBook();
    }
    print("Please enter the book author:");
    String author = stdin.readLineSync()!;
    try {
      if (author == "") {
        throw Exception("Please enter the book author");
      }
    } catch (e) {
      print(e);
      return addBook();
    }
    print("Please enter the book category:");
    String category = stdin.readLineSync()!;
    try {
      if (category == "") {
        throw Exception("Please enter the book category");
      }
    } catch (e) {
      print(e);
      return addBook();
    }
    print("Please enter the book year:");
    int year = int.parse(stdin.readLineSync()!);
    try {
      if (year == 0 || year.isNaN) {
        throw Exception("Please enter the book year");
      }
    } catch (e) {
      FormatException();
      return addBook();
    }
    print("Please enter the book quantity:");
    int quantity = int.parse(stdin.readLineSync()!);
    try {
      if (quantity == 0 || quantity.isNaN) {
        throw Exception("Please enter the book quantity");
      }
    } catch (e) {
      FormatException();
      return addBook();
    }
    print("Please enter the book price:");
    double price = double.parse(stdin.readLineSync()!);
    try {
      if (price == 0 || price.isNaN) {
        throw Exception("Please enter the book price");
      }
    } catch (e) {
      FormatException();
      return addBook();
    }
    if (library.books.any((element) => element.id == id)) {
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
      try {
        if (title == "") {
          throw Exception("Please enter the book title");
        }
      } catch (e) {
        print(e);
        return updateBook();
      }
      print("Please enter the book author");
      String author = stdin.readLineSync()!;
      try {
        if (author == "") {
          throw Exception("Please enter the book author");
        }
      } catch (e) {
        print(e);
        return updateBook();
      }
      print("Please enter the book category");
      String category = stdin.readLineSync()!;
      try {
        if (category == "") {
          throw Exception("Please enter the book category");
        }
      } catch (e) {
        print(e);
        return updateBook();
      }
      print("Please enter the book year");
      int year = int.parse(stdin.readLineSync()!);
      try {
        if (year == 0 || year.isNaN) {
          throw Exception("Please enter the book year");
        }
      } catch (e) {
        FormatException();
        return updateBook();
      }
      print("Please enter the book quantity");
      int quantity = int.parse(stdin.readLineSync()!);
      try {
        if (quantity == 0 || quantity.isNaN) {
          throw Exception("Please enter the book quantity");
        }
      } catch (e) {
        FormatException();
        return updateBook();
      }
      print("Please enter the book price");
      double price = double.parse(stdin.readLineSync()!);
      try {
        if (price == 0 || price.isNaN) {
          throw Exception("Please enter the book price");
        }
      } catch (e) {
        FormatException();
        return updateBook();
      }
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
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      }
    } catch (e) {
      print(e);
      return viewReceipt();
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
