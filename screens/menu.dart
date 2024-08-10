import '../model/user/user.dart';
import '../model/user/customer.dart';
import '../model/user/admin.dart';
import '../model/library.dart';
import 'dart:io';
import '../bin/library_system.dart';

menu(Library lib, User? user) {
  bool isExit = false;

  do {
    if (user != null) {
      if (user is Admin) {
        print(yellow('\n1- Add a Book'));
        print(yellow('2- Remove a Book'));
        print(yellow('3- Display All Customers'));
        print(yellow('4- Display All Books'));
        print(yellow('0- Exit'));

        stdout.write(cyan('\nEnter your choice: '));
        String? choice = stdin.readLineSync();

        switch (choice) {
          case '1':
            try{
              lib.addBook();
            }catch(e){
              print(red(e));
            }
          case '2':
            stdout.write(cyan('Enter Book ID: '));
            String? bookId = stdin.readLineSync();
            try {
              lib.removeBook(bookId!);
            } catch (e) {
              print(red(e));
            }
          case '3':
            Admin.displayAllCustomers();
          case '4':
            lib.displayAllBooks();
          case '0':
            isExit = true;
          default:
            print(red('Invalid Choice!!'));
        }
      } else {
        print(yellow('\n1- Display available Books'));
        print(yellow('2- Display Purchased Books'));
        print(yellow('3- Buy a Book'));
        print(yellow('0- Exit'));

        stdout.write(cyan('\nEnter your choice: '));
        String? choice = stdin.readLineSync();

        switch (choice) {
          case '1':
            lib.displayAllBooks();
          case '2':
            (user as Customer).displayPurchasedBooks();
          case '3':
            lib.displayAllBooks();
            stdout.write(cyan('Enter Book ID: '));
            String bookId = stdin.readLineSync()!;
            try {
             lib.buyBook(user: user, bookId: bookId);
            } catch (e) {
              print(red(e));
            }
          case '0':
            isExit = true;
          default:
            print(red('Invalid Choice!!'));
        }
      }
    }else{
     print(red('Login Failed!!'));
      isExit = true;
    }
  } while (!isExit);
}
