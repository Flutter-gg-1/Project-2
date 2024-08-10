import 'dart:io';

import './library.dart';
import './customer.dart';
import '../global/global_variabels.dart';
import './purchase.dart';
import '../global/print_with_color.dart';
import '../global/check_input.dart';

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
        isExitMainBuyBook = true;
      } else {
        PrintWithColors.red("Sorry! we don't have this quantity");
        isExitMainBuyBook = false;
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
    bool isExitUserInputID = false;
    bool isExitUserInputQnt = false;
    String? userInputID;
    String? userInputQnt;
    PrintWithColors.yellow('''

HOME -> CUSTOMER -> BUY BOOK
---------------------------------------
''');
    do {
      do {
        print("Enter book ID :");
        userInputID = stdin.readLineSync()!;
        isExitUserInputID =
            checkInput(userInputID, "You must enter a number of book.");
      } while (!isExitUserInputID);

      do {
        print("Enter the quntity :");
        userInputQnt = stdin.readLineSync()!;
        if (int.tryParse(userInputQnt) != null &&
            int.tryParse(userInputQnt)! > 0) {
          isExitUserInputQnt = true;
        } else {
          isExitUserInputQnt = false;
          PrintWithColors.red("You must enter a number greater than 0.");
        }
      } while (!isExitUserInputQnt);

      MyLibrary.buyBook(userInputID, int.parse(userInputQnt), user);
    } while (!isExitMainBuyBook);
  }
}
