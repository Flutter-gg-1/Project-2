import 'package:library_system/models/book.dart';

// class to represent customer
class Customer {
  final int customerId;
  final String name;
  double balance;
  List<Book> cart = [];

  Customer({required this.customerId, required this.name, required this.balance});

  set setBalance(double newBalance) {
    balance = newBalance;
  }

  get getBalance {
    return balance;
  }

  void buyBook(Book book) {
    if(book.quantity == 0) {
      print("ERROR : Book ${book.title} is out of stock ❌\n");
    }
    else {
      book.quantity -= 1;
      setBalance = balance - book.price;
      print("Book ${book.title} is purchased successfully ✅\n");
    }
  }
}