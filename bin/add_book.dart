import 'library_list.dart';
import 'dart:io';

//this function is used by the admin to add a new book to library 
addBook({
  required int bookId,
  required String bookTitle,
  required List<String> bookAuthors,
  required List<String> bookCategories,
  required int bookYear,
  required int bookQuantity,
  required int bookPrice,
}) {
  //Variables
  int id = bookId;
  String title = bookTitle;
  List<String> authors = bookAuthors;
  List<String> categories = bookCategories;
  int year = bookYear;
  int quantity = bookQuantity;
  int price = bookPrice;

  // map of book data
  Map<String, dynamic> newBook = {
    "id": id,
    "title": title,
    "authors": authors,
    "categories": categories,
    "year": year,
    "quantity": quantity,
    "price": price,
  };

  //to add book data to library
  libraryList.add(newBook);

  print(" * The book is added successfully * ");
  stdin.readLineSync();
}
