import 'dart:io';
import 'library_data.dart';
import 'print_with_color.dart';
import 'view_receipt_admin.dart';
import 'view_receipt_customer.dart';
import 'customer.dart';

/*
This function for buying a book 
 */

buyBook() {
  print("Please enter your ID: ");
  String userId = stdin.readLineSync()!;
  print("Please enter book'd ID: ");
  String id = stdin.readLineSync()!;

  List<dynamic> books = List.from(libraryData['library']);
  // iterate for evert element in list
  for (int i = 0; i < books.length; i++) {
    /**
     * if book's id exist and quantity of book is available the customer can buy the book
     * if book is available the customer specify how many copy he would like to buy
     * and decrease the available quantity to number of copy
     * else if the book not available or the book's id not found the customer can not buy the book
     * 
     */
    if (books[i]['id'] == id && books[i]['quantity'] > 0) {
      print("How many copy do you want?: ");
      int? copy;
      try {
        copy = int.parse(stdin.readLineSync()!);
      } catch (error) {
        printWithColor(text: "A number must be entered.", color: "Red");
        print(error);
        printWithColor(
            text: "\nTo return back to the main features press (Enter)\n",
            color: "Black");
        stdin.readLineSync();
        customer();
      }
      if (copy! <= books[i]['quantity']) {
        printWithColor(
            text: "The book was successfully purchased", color: "Green");
        books[i]['quantity'] - copy;
        // add book's details that was purchased to customer list an admin lists
        receipts.add({
          "customerID": userId,
          "title": books[i]['title'],
          "price": books[i]['price'],
          "quantity": copy,
          "time": DateTime.now().toString()
        });
        localReceipts.add({
          "customerID": userId,
          "title": books[i]['title'],
          "price": books[i]['price'],
          "quantity": copy,
          "time": DateTime.now().toString()
        });
      } else {
        printWithColor(
            text: "\nThe available quantitiy is ${books[i]['quantity']}\n",
            color: "Red");
      }
      printWithColor(
          text: "\nTo return back to the main features press (Enter)\n",
          color: "Black");
      stdin.readLineSync();
      return;
    }
  }

  printWithColor(text: "\nSorry, the book with $id is out of stock or not found", color: "Red");
  printWithColor(
      text: "\nTo return back to the main features press (Enter)\n",
      color: "Black");
  stdin.readLineSync();
}
