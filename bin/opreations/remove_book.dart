import '../library_list.dart';
import 'dart:io';

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
    print(" * The book with ID $bookId is removed successfully *");
  } else {
    print(" X Book ID is not exist! X ");
  }
  stdin.readLineSync();
}
