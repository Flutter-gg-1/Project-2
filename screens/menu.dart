import '../model/user/user.dart';
import '../model/user/customer.dart';
import '../model/user/admin.dart';
import '../model/library.dart';
import 'dart:io';

menu(Library lib, User? user) {
  bool isExit = false;

  do {
    if (user != null) {
      if (user is Admin) {
        print('\n1- Add a Book');
        print('2- Remove a Book');
        print('3- Display All Customers');
        print('4- Display All Books');
        print('0- Exit');

        stdout.write('\nEnter your choice: ');
        String? choice = stdin.readLineSync();

        switch (choice) {
          case '1':
            try{
              lib.addBook();
            }catch(e){
              print(e);
            }
          case '2':
            stdout.write('Enter Book ID: ');
            String? bookId = stdin.readLineSync();
            try {
              lib.removeBook(bookId!);
            } catch (e) {
              print(e);
            }
          case '3':
            Admin.displayAllCustomers();
          case '4':
            lib.displayAllBooks();
          case '0':
            isExit = true;
          default:
            print('Invalid Choice!!');
        }
      } else {
        print('\n1- Display available Books');
        print('2- Display Purchased Books');
        print('3- Buy a Book');
        print('0- Exit');

        stdout.write('\nEnter your choice: ');
        String? choice = stdin.readLineSync();

        switch (choice) {
          case '1':
            lib.displayAllBooks();
          case '2':
            (user as Customer).displayPurchasedBooks();
          case '3':
            lib.displayAllBooks();
            stdout.write('Enter Book ID: ');
            String? bookId = stdin.readLineSync();
            try {
              lib.buyBook(user: user, bookId: bookId!);
            } catch (error) {
              print('Please enter a value in Book ID');
            }
          case '0':
            isExit = true;
          default:
            print('Invalid Choice!!');
        }
      }
    }else{
     print('Login Failed!!');
      isExit = true;
    }
  } while (!isExit);
}
