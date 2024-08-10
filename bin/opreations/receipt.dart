import '../library_list.dart';
import 'dart:io';
import '../receipt_list.dart';
import '../color_print.dart/print_with_colors.dart';

//function to create receipt for purchases
receipt({required String bookId, required int customerId}) {
  //variable
  int receiptId = 1;
  String purchaseDate = DateTime.now().toString();
  //search for book using book ID
  Map<String, dynamic> book = {};
  for (var element in libraryList) {
    if (element["id"] == bookId) {
      book = element;
      break;
    }
  }
  if (book.isNotEmpty) {
    //map of receipt data
    Map<String, dynamic> receiptData = {
      "receiptId": receiptId,
      "bookId": bookId,
      "bookTitle": book["title"],
      "customerId": customerId,
      "purchaseDate": purchaseDate,
      "bookPrice": book["price"],
      "bookQuantity": book["quantity"],
      "bookAuthors": book["authors"],
      "bookCategories": book["categories"],
      "bookYear": book["year"],
    };

    receiptList.add(receiptData);
    printWithColor(
        text:
            " * Receipt with ID $receiptId for customer $customerId is added successfully * ",
        color: "Green");
    receiptId++;
  } else {
    printWithColor(text: " X Book with ID $bookId not found X ", color: "Red");
  }

  stdin.readLineSync();
}
