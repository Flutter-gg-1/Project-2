import 'dart:io';

//function for display all receiptes for admin
allReceipts({required List<Map<String, dynamic>> receiptes}) {
  print(
      "\n_____________________________All Receipts_____________________________\n");
  //print each receipt data
  for (var element in receiptes) {
    if (receiptes.isNotEmpty) {
      print(" * Receipt ID is: ${element["receiptId"]}");
      print(" * Book ID is: ${element["bookId"]}");
      print(" * Book title is: ${element["bookTitle"]}");
      print(" * Customer ID is: ${element["customerId"]}");
      print(" * Purchase date is: ${element["purchaseDate"]}");
      print("_________________________________________________\n");
    }
  }
  stdin.readLineSync();
}
