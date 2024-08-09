import 'dart:io';

import './library.dart';
import './customer.dart';
import '../global_variabels.dart';
import './purchase.dart';

class MyLibrary {
  static void displayBooks(String user) {
    print('''

HOME -> $user -> CUSTOMER PURCHASE
---------------------------------------
''');
    print(" ID   Price        Title ");
    for (var element in myBook) {
      print('''_________________________________________________________________
  ${element.id}  ${element.price} SAR     ${element.title}${element.authors} Year:${element.year} (QNT:${element.quantity})''');
    }
  }

  static void addBook(Book book) {
    myBook.add(book);
    bookID++;
  }

  static void removeBook(String id) {
    String value = "";

    for (var element in myBook) {
      if (id == element.id) {
        myBook.remove(element);
        value =
            "Book ID :${element.id} => Name : ${element.title} Delete it successfully ";
        break;
      } else {
        value = "Sorry! we can't find book ID";
      }
    }
    print(value);
  }

  static void buyBook(String id, int quantity, Customer customer) {
    String value = "";
    for (var element in myBook) {
      if (id == element.id) {
        if (element.quantity >= quantity) {
          var customerPurchase = Purchase(
              pid: "P$purchaseID",
              createAt: DateTime.now(),
              customer: customer,
              amount: quantity * element.price,
              id: id,
              title: element.title,
              authors: element.authors,
              categories: element.categories,
              year: element.year,
              quantity: quantity,
              price: element.price);
          myPurchase.add(customerPurchase);
          element.quantity -= quantity;
          purchaseID++;
          value = "Purchase it complete it :)";

          break;
        } else {
          value = "Sorry! we don't have this quantity";
          break;
        }
      } else {
        value = "ID not founded!";
      }
    }
    print(value);
  }

  static void displayOneCustomerPurchase() {
    print('''

HOME -> CUSTOMER -> CUSTOMER PURCHASE
---------------------------------------
''');
    if (myPurchase.isEmpty) {
      print("None of the books have been purchased.");
    } else {
      for (var element in myPurchase) {
        if (element.customer.id == user.id) {
          print("-----------------${element.pid}------------------");
          print("-------------------------------------------");
          print("Date    : ${element.createAt}");
          print("Title   : ${element.title}");
          print("Quntity : ${element.quantity}");
          print("Price   : ${element.price} SAR");
          print("------------------------------------------");
          print("Amout   : ${element.amount} SAR");
          print("-----------------END----------------------");
          break;
        }
      }
    }
  }

  static void displayCustomerPurchase() {
    print('''

HOME -> ADMIN -> CUSTOMERS PURCHASES
---------------------------------------
''');
    if (myPurchase.isEmpty) {
      print("None of the books have been purchased.");
    } else {
      for (var element in myPurchase) {
        print("-------------------------------------------");
        print("-----------------${element.pid}------------------");
        print("--------------------------------------------");
        print("Date    : ${element.createAt}");
        print("Title   : ${element.title}");
        print("Quntity : ${element.quantity}");
        print("Price   : ${element.price} SAR");
        print("--------------------------------------------");
        print("Amout   : ${element.amount} SAR");
        print("-----------------END----------------------");
      }
    }
  }

  static void getInfoBuyBook() {
    print("Enter book ID :");
    String userInputID = stdin.readLineSync()!;
    print("Enter the quntity :");
    int userInputQnt = int.parse(stdin.readLineSync()!);
    MyLibrary.buyBook(userInputID, userInputQnt, user);
  }
}
