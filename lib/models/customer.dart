import 'dart:io';                                     // library used to interact with user
import 'dart:math';                                   // library used to generate random id
import 'package:library_system/models/book.dart';     // book class
import 'package:library_system/models/receipt.dart';  // receipt class

// class to represent customer
class Customer {
  final int customerId;
  final String name;
  double balance;
  List<Book> cart = [];
  List<Receipt> receipts = [];

  Customer({required this.customerId, required this.name, required this.balance});

  set setBalance(double newBalance) {
    balance = newBalance;
  }

  get getBalance {
    return balance;
  }

  void viewReceipt({required Receipt receipt}) {
    print("Book Name : ${receipt.book.title}");
    print("Book authors : ${receipt.book.authors}");
    print("Book Price : ${receipt.book.price}");
    print("Date Purchased : ${DateTime.now().toString()}");
    print('\n');
  }

  void buyBook(Book book) {
    if(book.quantity == 0) {
      print("ERROR : Book ${book.title} is out of stock ❌\n");
    }
    else if (book.price > balance) {
      print("ERROR : not enough amount to buy ${book.title} ❌\n");
    }
    else {
      book.quantity -= 1;
      setBalance = balance - book.price;
      
      int receiptId = Random().nextInt(99999);
      Receipt receipt = Receipt(book: book, receiptId: receiptId, date: DateTime.now().toString());
      receipts.add(receipt);
      
      print("Book ${book.title} is purchased successfully ✅\n");
      
      stdout.write("View receipt ? (y/n) : ");
      String? answer = stdin.readLineSync();
      while (answer == null || (answer.toLowerCase() != 'y' && answer.toLowerCase() != 'n')) {
        print("ERROR : Invalid Input ❌\n");
        stdout.write("View receipt ? (y/n) : ");
        answer = stdin.readLineSync();
      }
      if (answer.toLowerCase() == 'y') {
        viewReceipt(receipt: receipt);
      }
    }
  }
}