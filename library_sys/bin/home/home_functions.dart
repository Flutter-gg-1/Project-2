import 'dart:io';

import '../library_manager/admin.dart';
import '../library_manager/customer.dart';
import '../model/book.dart';
import '../model/user.dart';
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

  // TODO: - implement User input for below functions!

  // Admin
  void addBook() {
    String? idInput;
    String? titleInput;
    String? authorsInput;
    String? categories;
    String? year;
    String? quantity;
    String? price;

    print('Adding a new Book');
    print('Enter cancel to go back');
    do {
      stdout.write('Enter a new Book ID (int):');
      idInput = stdin.readLineSync();
    } while (!verifyID(idInput ?? ''));

    do {} while (!verifyTitle(titleInput ?? ''));

    do {} while (!verifyAuthors(authorsInput ?? ''));

    // var inputTitle = stdin.readLineSync();

    // library.addBook(Book.book1);
  }

  void removeBook() => library.removeBook(Book.book1);
  void viewAllReciepts() => library.viewAllReciepts();

  // Customer
  void buyBook() =>
      library.buyBook(customer: currentUser!, bookId: '', quantity: 1);
  void viewReciepts() => library.viewReciepts(customer: currentUser!);
}
