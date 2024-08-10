import '../library_list.dart';
import 'dart:io';
import '../color_print.dart/print_with_colors.dart';

//this function is used by the admin to remove a book from the library
removebook({required String bookId}) {
  //search for book using book ID
  Map<String, dynamic> book = {};
  for (var element in libraryList) {
    if (element["id"] == bookId) {
      book = element;
      break;
    }
  }
  //error handling if the book ID is not exist
  if (book.isNotEmpty) {
    libraryList.remove(book);
    printWithColor(
        text: " * The book with ID $bookId is removed successfully * ",
        color: "Green");
  } else {
    printWithColor(text: " X Book ID is not exist! X ", color: "Red");
  }
  stdin.readLineSync();
}
