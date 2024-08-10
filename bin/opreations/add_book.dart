import '../library_list.dart';
import 'dart:io';

//this function is used by the admin to add a new book to library
addBook({
  required String bookId,
  required String bookTitle,
  required List<String> bookAuthors,
  required List<String> bookCategories,
  required int bookYear,
  required int bookQuantity,
  required double bookPrice,
}) {
  //Variables
  String id = bookId;
  String title = bookTitle;
  List<String> authors = bookAuthors;
  List<String> categories = bookCategories;
  int year = bookYear;
  int quantity = bookQuantity;
  double price = bookPrice;

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
  //to add new book to library system
  libraryList.add(newBook);
  print(" * The book is added successfully * ");
  print(" * Book ID is: $id");
  print(" * Book title is: $title");
  print(" * Book authors is: $authors");
  print(" * Book categories is: $categories");
  print(" * Book year is: $year");
  print(" * Book quantity is: $quantity");
  print(" * Book price is: $price");

  stdin.readLineSync();
}
