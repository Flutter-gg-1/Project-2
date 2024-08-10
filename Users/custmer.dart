import 'dart:io';

import '../muodiles/bookStore.dart';

class Custmer {
  late String userName; //attrbute used for log in
  late String password;
  List<Map<String, dynamic>> customerReceipts =
      []; //this list used to save the receipts

  Custmer({required this.userName, required this.password});

  List<Map<String, dynamic>> buyBook(BookStore bookStore) {
    //function to buy a book
    print("Enter the ID of the book you want to buy:");
    String id = stdin.readLineSync()!; //here i chose to buy the book by the id

    try {
      //error handling
      var book = bookStore.library.firstWhere(
        (book) => book.id == id, //to find the book in the library by its id
        orElse: () => throw Exception(
            "Book ID not found!"), //if the book not found throw exception
      );

      if (book.quantity > 0) {
        //here it will compare ifter find the book if there quantity to by

        print("You have buy ${book.title} for ${book.price}SR");
        Map<String, dynamic> receipt = {
          'Book ID': book.id,
          'Title': book.title,
          'Price': book.price,
          'Quantity': 1,
          'Total Cost': book.price,
        };
        customerReceipts.add(receipt); //adding the receipt to the list
        book.quantity =
            book.quantity - 1; //descrise the quantity after buy a book
      } else {
        print(
            "${book.title} is out of stock."); //here if there no quantity for the book this massege will apper
      }
    } catch (e) {
      //here we wil chatch the error
      print(e); //and print it
    }
    return customerReceipts; //I used return to return the value of the customerReceipts
  }

  void viewAllBooks(BookStore bookStore) {
    //here i will view all the books
    print("Available Books:");
    for (var book in bookStore.library) {
      //I used for loop to previeww all the books in store
      print(book.toJson());
    }
  }

  viewReceipt() {
    // here I used the list the contin the receipt and print it using for loop
    print("Customer Viewing Receipts:");
    for (var receipt in customerReceipts) {
      print(receipt);
    }
  }
}
