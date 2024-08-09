import 'dart:io';

import './library.dart';
import './customer.dart';
import '../global/global_variabels.dart';
import './purchase.dart';
import '../global/print_with_color.dart';

class MyLibrary {
  //Display All books for admin & Customer
  static void displayBooks(String user) {
    PrintWithColors.yellow('''

HOME -> $user -> Display BOOKS
---------------------------------------
''');
    PrintWithColors.yellow(" ID   Price        Title ");
    for (var element in myBook) {
      PrintWithColors.yellow(
          '''_________________________________________________________________
  ${element.id}  ${element.price} SAR     ${element.title}${element.authors} Year:${element.year} (QNT:${element.quantity})''');
    }
  }

  static void addBook(Book book) {
    myBook.add(book);
    bookID++;
  }

  static void removeBook(String id) {
    bool foundID = false;
    String? title;
    for (var element in myBook) {
      if (id == element.id) {
        foundID = true;
        title = element.title;
        myBook.remove(element);
        break;
      } else {
        foundID = false;
      }
    }

    if (foundID) {
      PrintWithColors.green("Book $id : $title Delete successfully");
    } else {
      PrintWithColors.red("Sorry! we can't find book ID");
    }
  }

  static void buyBook(String id, int quantity, Customer customer) {
    bool foundID = false;
    bool isThereQnt = false;
    for (var element in myBook) {
      if (id == element.id) {
        foundID = true;

        if (element.quantity >= quantity) {
          isThereQnt = true;
          // create a new purchase
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
          break;
        } else {
          isThereQnt = false;
          break;
        }
      } else {
        foundID = false;
      }
    }
    if (foundID) {
      if (isThereQnt) {
        PrintWithColors.green("Purchase it complete it :)");
      } else {
        PrintWithColors.red("Sorry! we don't have this quantity");
      }
    } else {
      PrintWithColors.red("ID not founded!");
    }
  }

//Display customer own purchase
  static void displayOneCustomerPurchase() {
    PrintWithColors.yellow('''

HOME -> CUSTOMER -> CUSTOMER PURCHASE
---------------------------------------
''');
    if (myPurchase.isEmpty) {
      PrintWithColors.red("None of the books have been purchased.");
    } else {
      for (var element in myPurchase) {
        if (element.customer.id == user.id) {
          PrintWithColors.yellow(
              "-----------------${element.pid}-------------------");
          PrintWithColors.yellow("-------------------------------------------");
          PrintWithColors.yellow("Date    : ${element.createAt}");
          PrintWithColors.yellow("Title   : ${element.title}");
          PrintWithColors.yellow("Quntity : ${element.quantity}");
          PrintWithColors.yellow("Price   : ${element.price} SAR");
          PrintWithColors.yellow("------------------------------------------");
          PrintWithColors.green("Amout   : ${element.amount} SAR");
          PrintWithColors.yellow("-----------------END----------------------");
        }
      }
    }
  }

// Display all customer purchases for admin
  static void displayCustomerPurchase() {
    PrintWithColors.yellow('''

HOME -> ADMIN -> CUSTOMERS PURCHASES
---------------------------------------
''');
    if (myPurchase.isEmpty) {
      PrintWithColors.red("None of the books have been purchased.");
    } else {
      for (var element in myPurchase) {
        PrintWithColors.yellow(
            "-----------------${element.pid}-------------------");
        PrintWithColors.yellow("--------------------------------------------");
        PrintWithColors.yellow("Date          : ${element.createAt}");
        PrintWithColors.yellow("Customer Name : ${element.customer.name}");
        PrintWithColors.yellow("Customer ID   : ${element.customer.id}");
        PrintWithColors.yellow("Title         : ${element.title}");
        PrintWithColors.yellow("Quntity       : ${element.quantity}");
        PrintWithColors.yellow("Price         : ${element.price} SAR");
        PrintWithColors.yellow("--------------------------------------------");
        PrintWithColors.green("Amout          : ${element.amount} SAR");
        PrintWithColors.yellow("-----------------END----------------------");
      }
    }
  }

  static void getInfoBuyBook() {
    PrintWithColors.yellow('''

HOME -> CUSTOMER -> BUY BOOK
---------------------------------------
''');
    print("Enter book ID :");
    String userInputID = stdin.readLineSync()!;
    print("Enter the quntity :");
    int userInputQnt = int.parse(stdin.readLineSync()!);
    MyLibrary.buyBook(userInputID, userInputQnt, user);
  }
}
