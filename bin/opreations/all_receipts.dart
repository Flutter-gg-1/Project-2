import 'dart:io';
import '../color_print.dart/print_with_colors.dart';

//function for display all receiptes for admin
allReceipts({required List<Map<String, dynamic>> receiptes}) {
  printWithColor(
      text:
          "\n_____________________________All Receipts_____________________________\n",
      color: "Black");

  //print each receipt data
  for (var element in receiptes) {
    if (receiptes.isNotEmpty) {
      printWithColor(
          text: " * Receipt ID is: ${element["receiptId"]}", color: "Cyan");
      printWithColor(
          text: " * Customer ID is: ${element["customerId"]}", color: "Cyan");
      printWithColor(
          text: " * Purchase date is: ${element["purchaseDate"]}",
          color: "Cyan");
      printWithColor(
          text: " * Book ID is: ${element["bookId"]}", color: "Cyan");
      printWithColor(
          text: " * Book title is: ${element["bookTitle"]}", color: "Cyan");
      printWithColor(
          text: " * Book authors is: ${element["bookAuthors"]}", color: "Cyan");
      printWithColor(
          text: " * Book categories is: ${element["bookCategories"]}",
          color: "Cyan");
      printWithColor(
          text: " * Book year is: ${element["bookYear"]}", color: "Cyan");
      printWithColor(
          text: " * Book Quantity is: ${element["bookQuantity"]}",
          color: "Cyan");
      printWithColor(
          text: " * Book Price is: ${element["bookPrice"]}", color: "Cyan");
      printWithColor(
          text: "_________________________________________________\n",
          color: "Black");
    }
  }
  stdin.readLineSync();
}
