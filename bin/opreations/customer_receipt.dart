import 'dart:io';
import '../receipt_list.dart';

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
    print("\n_______________ Customer $customerId receipts _______________ \n");
    print(" * Receipt ID is: ${receipt["receiptId"]}");
    print(" * Customer ID is: ${receipt["customerId"]}");
    print(" * Purchase date is: ${receipt["purchaseDate"]}");
    print(" * Book ID is: ${receipt["bookId"]}");
    print(" * Book title is: ${receipt["bookTitle"]}");
    print(" * book Price is: ${receipt["bookPrice"]}");
    print(" * book Quantitye is: ${receipt["bookQuantity"]}");
    print(" * book Authors is: ${receipt["bookAuthors"]}");
    print(" * book Categories is: ${receipt["bookCategories"]}");
    print(" * book Year is: ${receipt["bookYear"]}");
    print("_________________________________________________\n");
  } else {
    print("there is no custmer id $customerId");
  }
  stdin.readLineSync();
}
