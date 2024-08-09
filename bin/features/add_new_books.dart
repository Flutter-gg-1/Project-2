import '../core/all_file.dart';
import 'dart:io';

// Implement Operations : Add a Book: Write a function to add new books to the library.
void addNewBook() {
  LibraryModel libraryObject = LibraryModel.fromJson(libraryJSONData);
  print('Add new books:');
  print('Enter book title:');
  String bookTitle = stdin.readLineSync()!;
  print('Enter book author:');
  String bookAuthor = stdin.readLineSync()!;
  print('Enter book category:');
  String bookCategory = stdin.readLineSync()!;
  print('Enter book year:');
  int bookYear = int.parse(stdin.readLineSync()!);
  print('Enter book quantity:');
  int bookQuantity = int.parse(stdin.readLineSync()!);
  print('Enter book price:');
  double bookPrice = double.parse(stdin.readLineSync()!);
  libraryObject.library.add({
    'id': (libraryObject.library.length + 1).toString(),
    'title': bookTitle,
    'authors': [bookAuthor],
    'categories': [bookCategory],
    'year': bookYear,
    'quantity': bookQuantity,
    'price': bookPrice,
  });
  print(libraryObject.toJson());
  print('\nBook added successfully.\n');
  adminDashboard();
}
