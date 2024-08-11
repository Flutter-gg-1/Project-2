import 'dart:io';

import '../models/book.dart';

void adminMenu() {
  print('Choose options :');
  print('1- Disply all book');
  print('2- Add book');
  print('3- Remove book');
  print('4- View the receipt for purchase');
  print('5- Exit');
}

//
Book adminAddBookInput() {
  // Prompt user for book details
  print('Enter book ID:');
  String id = stdin.readLineSync()!;

  print('Enter book title:');
  String title = stdin.readLineSync()!;

  print('Enter book authors (comma separated):');
  List<String> authors = stdin.readLineSync()!.split(',');

  print('Enter book categories (comma separated):');
  List<String> categories = stdin.readLineSync()!.split(',');

  print('Enter book year:');
  int year = int.parse(stdin.readLineSync()!);

  print('Enter book quantity:');
  int quantity = int.parse(stdin.readLineSync()!);

  print('Enter book price:');
  double price = double.parse(stdin.readLineSync()!);

  // Create a new book instance with user input
  Book newBook = Book(
    id: id,
    title: title,
    authors: authors,
    categories: categories,
    year: year,
    quantity: quantity,
    price: price,
  );
  return newBook;
}
