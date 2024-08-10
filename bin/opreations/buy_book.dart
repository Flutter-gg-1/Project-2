import '../library_list.dart';
import 'dart:io';
import 'receipt.dart';
import '../color_print.dart/print_with_colors.dart';

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
    printWithColor(text: "X Book ID does not exist! X", color: "Red");
    return;
  }

  // Check if the requested quantity is valid
  if (bookQuantity <= 0) {
    printWithColor(text: "X Quantity must more than zero! X", color: "Red");
    return;
  }
  if (bookQuantity > book['quantity']) {
    printWithColor(text: "X Not enough books available! X", color: "Red");

    return;
  }

  // Create receipt
  receipt(bookId: bookId, customerId: customerId);
  book['quantity'] -= bookQuantity;
  //remove book from library
  if (book['quantity'] == 0) {
    libraryList.remove(book);
  }
  printWithColor(
      text: " * The book with ID $bookId has been purchased successfully *",
      color: "Green");

  stdin.readLineSync();
}
