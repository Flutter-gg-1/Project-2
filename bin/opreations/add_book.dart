import '../library_list.dart';
import 'dart:io';
import '../color_print.dart/print_with_colors.dart';

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
  printWithColor(text: " * The book is added successfully * ", color: "Green");
  printWithColor(text: " * Book ID is: $id", color: "Green");
  printWithColor(text: " * Book title is: $title", color: "Green");
  printWithColor(text: " * Book authors is: $authors", color: "Green");
  printWithColor(text: " * Book categories is: $categories", color: "Green");
  printWithColor(text: " * Book year is: $year", color: "Green");
  printWithColor(text: " * Book quantity is: $quantity", color: "Green");
  printWithColor(text: " * Book price is: $price", color: "Green");

  stdin.readLineSync();
}
