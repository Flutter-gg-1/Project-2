import 'dart:io';

import '../global_varbiels.dart';
import '../models/book_model.dart';

addBook() {
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
    bookcategories.add(inputin);
  }
  int year;
  int quantity;
  try {
    print("Enter book year:");
    year = int.parse(stdin.readLineSync()!);
  } catch (e) {
    year = 0;
    print("you did not enter a year defult value is 0");
  }
  try {
    print("Enter book quantity:");
    quantity = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("you did not enter a quantity defult value is 0");
    quantity = 0;
  }

  if (bookId == "") {
    print("ID must no be empty");
  } else if (bookTitle == "") {
    print("Book title must no be empty");
  } else if (authors.isEmpty) {
    print("Book authors list must at least contains one auther");
  } else if (bookcategories.isEmpty) {
    print("Book categories list must at least contains one catogray");
  } else {
    library.library.add(Book(
        id: bookId,
        title: bookTitle,
        authors: authors,
        categories: bookcategories,
        year: year,
        quantity: quantity));

    print("-----Book added successfully-----");
  }
}
