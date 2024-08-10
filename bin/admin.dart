import 'dart:io';
import 'management.dart';
import 'package:project_2/database/json/library.dart';
import 'package:project_2/database/model/model.dart';
import '../lib/helpers/color_print.dart';

class AdminPermissions {
  Library library = Library.fromJson(libraryBook);

  adminInput() {
    bool isExit = false;
    int adminChoice;
    do {
      print("Please enter your choice:");
      printInfo("1. Add book");
      printInfo("2. Remove book");
      printInfo("3. Update book");
      printInfo("4. View receipt");
      printInfo("5. View books");
      printError("6. Sign out");
      printError("7. Exit");
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
          printSuccess("Thank you for using the library system :D");
          printSuccess("Goodbye!");
          isExit = true;
          break;
        default:
          printWarning("Invalid option");
      }
    } while (!isExit);
  }

  // Can add books.
  void addBook() {
    printInfo("Add book");
    printInfo("Please enter the book id:");
    String id = stdin.readLineSync()!;
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      } else if (library.books.any((element) => element.id == id)) {
        printWarning("Book already exists\n");
        return addBook();
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    printInfo("Please enter the book title:");
    String title = stdin.readLineSync()!;
    try {
      if (title == "") {
        throw Exception("Please enter the book title");
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    printInfo("Please enter the book author:");
    String author = stdin.readLineSync()!;
    try {
      if (author == "") {
        throw Exception("Please enter the book author");
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    printInfo("Please enter the book category:");
    String category = stdin.readLineSync()!;
    try {
      if (category == "") {
        throw Exception("Please enter the book category");
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    printInfo("Please enter the book year:");
    int year = int.parse(stdin.readLineSync()!);
    try {
      if (year == 0 || year.isNaN) {
        throw Exception("Please enter the book year");
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    printInfo("Please enter the book quantity:");
    int quantity = int.parse(stdin.readLineSync()!);
    try {
      if (quantity == 0 || quantity.isNaN) {
        throw Exception("Please enter the book quantity");
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    printInfo("Please enter the book price:");
    double price = double.parse(stdin.readLineSync()!);
    try {
      if (price == 0 || price.isNaN) {
        throw Exception("Please enter the book price");
      }
    } catch (e) {
      printError(e.toString());
      return addBook();
    }
    library.books
        .add(Book(id, title, [author], [category], year, quantity, price));
    printSuccess("Book added successfully");
  }

  // Can remove books.
  removeBook() {
    printInfo("Remove book");
    printInfo("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      library.books.removeWhere((element) => element.id == id);
      printSuccess("Book removed successfully");
    } else {
      printWarning("Book not found");
      return removeBook();
    }
  }

  // Can update book details.
  void updateBook() {
    printInfo("Update book");
    printInfo("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      printInfo("Please enter the book title:");
      String title = stdin.readLineSync()!;
      try {
        if (title == "") {
          throw Exception("Please enter the book title");
        }
      } catch (e) {
        printError(e.toString());
        return updateBook();
      }
      printInfo("Please enter the book author:");
      String author = stdin.readLineSync()!;
      try {
        if (author == "") {
          throw Exception("Please enter the book author");
        }
      } catch (e) {
        printError(e.toString());
        return updateBook();
      }
      printInfo("Please enter the book category:");
      String category = stdin.readLineSync()!;
      try {
        if (category == "") {
          throw Exception("Please enter the book category");
        }
      } catch (e) {
        printError(e.toString());
        return updateBook();
      }
      printInfo("Please enter the book year:");
      int year = int.parse(stdin.readLineSync()!);
      try {
        if (year == 0 || year.isNaN) {
          throw Exception("Please enter the book year");
        }
      } catch (e) {
        printError(e.toString());
        return updateBook();
      }
      printInfo("Please enter the book quantity:");
      int quantity = int.parse(stdin.readLineSync()!);
      try {
        if (quantity == 0 || quantity.isNaN) {
          throw Exception("Please enter the book quantity");
        }
      } catch (e) {
        printError(e.toString());
        return updateBook();
      }
      printInfo("Please enter the book price:");
      double price = double.parse(stdin.readLineSync()!);
      try {
        if (price == 0 || price.isNaN) {
          throw Exception("Please enter the book price");
        }
      } catch (e) {
        printError(e.toString());
        return updateBook();
      }
      library.books.removeWhere((element) => element.id == id);
      library.books
          .add(Book(id, title, [author], [category], year, quantity, price));
      printSuccess("Book updated successfully");
    } else {
      printWarning("Book not found");
    }
  }

  // Can view the receipt for purchases.
  void viewReceipt() {
    printInfo("View receipt");
    printInfo("Please enter the book id:");
    String id = stdin.readLineSync()!;
    if (library.books.any((element) => element.id == id)) {
      var book = library.books.firstWhere((element) => element.id == id);
      printInfo("ID: ${book.id}");
      printInfo("Title: ${book.title}");
      printInfo("Author: ${book.authors}");
      printInfo("Category: ${book.categories}");
      printInfo("Year: ${book.year}");
      printInfo("Quantity: ${book.quantity}");
      printInfo("Price: ${book.price}");
    } else {
      printWarning("Book not found");
    }
    try {
      if (id == "") {
        throw Exception("Please enter the book id");
      }
    } catch (e) {
      printError(e.toString());
      return viewReceipt();
    }
  }

  // Can view all books.
  void viewBooks() {
    printInfo("View books");
    for (var book in library.books) {
      printInfo("ID: ${book.id}");
      printInfo("Title: ${book.title}");
      printInfo("Author: ${book.authors}");
      printInfo("Category: ${book.categories}");
      printInfo("Year: ${book.year}");
      printInfo("Quantity: ${book.quantity}");
      printInfo("Price: ${book.price}\n");
    }
  }
}
