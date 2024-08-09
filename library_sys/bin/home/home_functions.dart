import 'dart:io';

import '../library_manager/admin.dart';
import '../library_manager/customer.dart';
import '../model/book_categories.dart';
import '../model/user.dart';
import '../utils/colorful_print.dart';
import 'home.dart';
import 'home_print_msg.dart';
import 'home_verifiction_funcs.dart';

extension HomeFunctions on Home {
  // Auth
  void signIn() {
    do {
      signInInstructions();
      var userInput = stdin.readLineSync();
      try {
        var inputNum = int.parse(userInput ?? '');
        currentUser = User.userList.where((e) => e.id == inputNum).firstOrNull;
      } catch (_) {
        print('No ID number found for $userInput');
      }
    } while (currentUser == null);
  }

  // Admin
  void addBook() {
    String? idInput,
        titleInput,
        authorsInput,
        categoriesInput,
        yearInput,
        quantityInput,
        priceInput;

    print('Adding a new Book');
    print('Enter \x1B[33cancel\x1B[0m to exit this screen');
    do {
      print('example Input for ID: 1');
      ColorfulStdout.magenta('Enter an ID number:');
      idInput = stdin.readLineSync();
    } while (!verifyID(idInput ?? ''));

    do {
      print('example Input for Title: Hello World!');
      ColorfulStdout.magenta('Enter a Title:');
      idInput = stdin.readLineSync();
    } while (!verifyTitle(titleInput ?? ''));

    do {
      print('example Input for Authors: Superman, Spiderman, Batman');
      ColorfulStdout.magenta('Enter comma separated Author names:');
      idInput = stdin.readLineSync();
    } while (!verifyAuthors(authorsInput ?? ''));

    do {
      BookCategories.showAll();
      print('example Input for Categories: 1, 3, 5');
      ColorfulStdout.magenta('Enter comma separated Category number:');
      idInput = stdin.readLineSync();
    } while (!verifyCategories(categoriesInput ?? ''));

    do {
      print('example Input for Year: 2020');
      ColorfulStdout.magenta('Enter Year:');
      idInput = stdin.readLineSync();
    } while (!verifyYear(yearInput ?? ''));

    do {
      print('example Input for Quantity: 15');
      ColorfulStdout.magenta('Enter Quantity:');
      idInput = stdin.readLineSync();
    } while (!verifyQuantity(quantityInput ?? ''));

    do {
      print('example Input for Price: 10.99');
      ColorfulStdout.magenta('Enter Price:');
      idInput = stdin.readLineSync();
    } while (!verifyPrice(priceInput ?? ''));
  }

  void removeBook() {
    // library.removeBook(Book.book1);
  }

  void viewAllReciepts() => library.viewAllReciepts();

  // Customer
  void buyBook() =>
      library.buyBook(customer: currentUser!, bookId: '', quantity: 1);
  void viewReciepts() => library.viewReciepts(customer: currentUser!);
}
