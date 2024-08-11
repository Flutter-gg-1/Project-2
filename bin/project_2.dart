import 'dart:io';
import './models/library.dart';
import './models/book.dart';
import 'functions/admin_functions.dart';
import 'functions/customer_menu.dart';
import './models/data.dart';
import './models/user.dart';

void main(List<String> arguments) {
  //
  Library rawanLibrary = Library.fromJson(librayData);
  bool isExit = false;
  do {
    print('Chose the options:');
    print('Are you admin or customer ?');
    String input = stdin.readLineSync()!;

    // if admin it will be true
    bool admin = User.checkRole(input);

    if (admin) {
      // If user is an admin, print the admin menu
      adminMenu();
      String input = stdin.readLineSync()!;

      // try and catch for input user handleng
      try {
        switch (input) {
          // Option 1 Display all books
          case '1':
            rawanLibrary.printAllbooks();
            break;
          case '2':
            //  Option 2: Add a new book
            Book bookDetails = adminAddBookInput();
            rawanLibrary.addBook(bookDetails);
            print(rawanLibrary.toJson());
            break;
          case '3':
            // Option 3: Remove a book
            rawanLibrary.printAllbooks();
            print('Enter book id to delete the book ');
            String bookTd = stdin.readLineSync()!;
            rawanLibrary.removeBook(bookTd);
            break;
          case '4':
            //  Option 4 :Receipt all Receipts
            rawanLibrary.displayAllReceipts();
            break;
          // Option 5: Exit the application
          case '5':
            isExit = true;
          default:
        }
      } catch (error) {
        // Print any error that occurs during the execution
        print(error);
      }
    }
    //=============== ((customer options)) ===============
    else {
      // If user is not an admin, print the customer menu
      customerMenu();
      String input = stdin.readLineSync()!;

      // try and catch for input user handleng
      try {
        switch (input) {
          // Option 1: Display all books
          case '1':
            rawanLibrary.printAllbooks();
            break;
          case '2':
            // Option 2: Buy a book
            print('Enter book id that you want to buy: ');
            String buyBook = stdin.readLineSync()!;
            bool purchaseSuccess = rawanLibrary.buyBook(buyBook);
            if (purchaseSuccess) {
              print('Book purchased successfully.');
            } else {
              print('Book is out of stock.');
            }
            break;
          case '3':
            // Option 3:Receipt all Receipts
            rawanLibrary.displayAllReceipts();
            break;
          case '4':
            // Option 4: Exit the application
            isExit = true;
            break;
          default:
        }
      } catch (error) {
        // Print any error that occurs during the execution
        print('An error occurred: $error');
      }
    }
  } while (!isExit);
}
