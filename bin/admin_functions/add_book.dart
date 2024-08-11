import 'dart:io';

import '../global_varbiels.dart';
import '../models/book_model.dart';

//function add book
addBook() {
  //aske admin to add id.
  print("Enter book id:");
  String bookId = stdin.readLineSync()!;

  //aske admin to add title.
  print("Enter book title:");
  String bookTitle = stdin.readLineSync()!;

  //aske admin to add list of authers and write done when the are done to exit.
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

//aske admin to add list of categories and write done when the are done to exit.
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

  //ask admin to add year and if they don't add a defult value
  try {
    print("Enter book year:");
    year = int.parse(stdin.readLineSync()!);
  } catch (e) {
    year = 0;
    print("you did not enter a year defult value is 0");
  }

  //ask admin to add quantity and if they don't add a defult value
  try {
    print("Enter book quantity:");
    quantity = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print("you did not enter a quantity defult value is 0");
    quantity = 0;
  }

//check for null values then add book
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
