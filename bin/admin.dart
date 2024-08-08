import 'dart:io';

import 'library_data.dart';
import 'models/library_model.dart';

admin() {
  bool isExit = false;
  Library library = Library.fromJson(libraryData);

  print("-------------------Welcome Admin-------------------");
  print("Choose what you want to do:");
  print("1. Add book");
  print("2. Delete book");
  print("3. View the receipt for users purchases");
  print("q. Exit");
  String input = stdin.readLineSync()!;
  do {
    switch (input) {
      case "1":
        library.addBook(newBook());

        break;
      case "2":
        print("enter id you want to delete");
        String bookId = stdin.readLineSync()!;
        library.removeBook(bookId);

        break;
      case "3":
        break;
      case "4":
        break;
      case "q" || "Q":
        {
          isExit = true;
        }

        break;
      default:
    }
  } while (!isExit);
}

Book newBook() {
  print("Enter book id:");
  String bookId = stdin.readLineSync()!;
  print("Enter book title:");
  String bookTitle = stdin.readLineSync()!;
  print("Book authors:");
  List authors = [];
  String input;
  while (true) {
    print('Enter an authors (or type "done" to finish):');
    input = stdin.readLineSync()!;

    if (input.toLowerCase() == 'done') {
      break;
    }
    authors.add(input);
  }

  print("Book categories:");
  List bookcategories = [];
  String inputin;
  while (true) {
    print('Enter an item (or type "done" to finish):');
    inputin = stdin.readLineSync()!;

    if (inputin.toLowerCase() == 'done') {
      break;
    }
    bookcategories.add(input);
  }

  print("Enter book year:");
  int year = int.parse(stdin.readLineSync()!);
  print("Enter book quantity:");
  int quantity = int.parse(stdin.readLineSync()!);

  Book newbook = Book(
      id: bookId,
      title: bookTitle,
      authors: authors,
      categories: bookcategories,
      year: year,
      quantity: quantity);

  return newbook;
}
