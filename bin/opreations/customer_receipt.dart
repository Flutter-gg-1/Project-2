import 'dart:io';
import '../receipt_list.dart';
import '../color_print.dart/print_with_colors.dart';

//this function is used to display receipt for customer using customer's ID
customerReceipt({required int customerId}) {
  //search for receipt using customer ID
  Map<String, dynamic> receipt = {};
  for (var element in receiptList) {
    if (element["customerId"] == customerId) {
      receipt = element;
    }
  }
  //if not empty print receipt
  if (receipt.isNotEmpty) {
    printWithColor(
        text:
            "\n_______________ Customer $customerId receipts _______________ \n",
        color: "Black");
    printWithColor(
        text: " * Receipt ID is: ${receipt["receiptId"]}", color: "Cyan");
    printWithColor(
        text: " * Customer ID is: ${receipt["customerId"]}", color: "Cyan");
    printWithColor(
        text: " * Purchase date is: ${receipt["purchaseDate"]}", color: "Cyan");
    printWithColor(text: " * Book ID is: ${receipt["bookId"]}", color: "Cyan");
    printWithColor(
        text: " * Book title is: ${receipt["bookTitle"]}", color: "Cyan");
    printWithColor(
        text: " * book Price is: ${receipt["bookPrice"]}", color: "Cyan");
    printWithColor(
        text: " * book Quantitye is: ${receipt["bookQuantity"]}",
        color: "Cyan");
    printWithColor(
        text: " * book Authors is: ${receipt["bookAuthors"]}", color: "Cyan");
    printWithColor(
        text: " * book Categories is: ${receipt["bookCategories"]}",
        color: "Cyan");
    printWithColor(
        text: " * book Year is: ${receipt["bookYear"]}", color: "Cyan");
    printWithColor(
        text: "_________________________________________________\n",
        color: "Black");
  } else {
    printWithColor(text: "There is no custmer id $customerId", color: "Red");
  }
  stdin.readLineSync();
}
