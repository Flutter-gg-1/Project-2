import '../library_list.dart';
import 'dart:io';
import 'receipt.dart';

//this function is used by a customer to buy a book form the library
buyBook(
    {required String bookId,
    required int customerId,
    required int bookQuantity}) {
  //search about book using book ID
  Map<String, dynamic> book = {};
  for (var element in libraryList) {
    if (element["id"] == bookId) {
      book = element;
      break;
    }
  }
  //cheack book is exist
  if (book.isEmpty) {
    print("X Book ID does not exist! X");
    return;
  }

  // Check if the requested quantity is valid
  if (bookQuantity <= 0) {
    print("X Quantity must more than zero! X");
    return;
  }
  if (bookQuantity > book['quantity']) {
    print("X Not enough book available! X");
    return;
  }

  // Create receipt
  receipt(bookId: bookId, customerId: customerId);
  book['quantity'] -= bookQuantity;
  //remove book from library
  if (book['quantity'] == 0) {
    libraryList.remove(book);
  }
  print(" * The book with ID $bookId has been purchased successfully *");

  stdin.readLineSync();
}
