import 'dart:io';

import 'models/book_model.dart';

Book newBook() {
  print("Enter book id:");
  String bookId = stdin.readLineSync()!;
  print("Enter book title:");
  String bookTitle = stdin.readLineSync()!;
  print("Book authors list:");
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

  print("Book categories list:");
  List bookcategories = [];
  String inputin;
  while (true) {
    print('Enter an category (or type "done" to finish):');
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

  print(newbook.toJson());
  print("-----Book added successfully-----");

  return newbook;
}
