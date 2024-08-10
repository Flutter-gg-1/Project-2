import 'dart:io';

import '../library_manager/library_manager.dart';
import '../model/user.dart';
import 'home_functions.dart';
import 'home_print_msg.dart';

class Home {
  var library = LibraryManager();
  var terminateApp = false;
  User? currentUser;

  void runApp() {
    welcomeMsg();
    do {
      if (currentUser == null) {
        signIn();
      } else {
        homeScreen();
      }
    } while (!terminateApp);
  }

  void homeScreen() {
    homeIndicatorMsg();
    var userInput = stdin.readLineSync();
    switch (userInput) {
      case 'i':
        commandsInstructions();
      case 'q':
        terminateMsg();
        terminateApp = true;
      case 'show':
        library.showAllBooks();
      case 'so':
        signOutMsg();
        signOUt();
      case 'add':
        (currentUser?.userRole == UserRole.admin) ? addBook() : accessDenied();
      case 'rm':
        (currentUser?.userRole == UserRole.admin)
            ? removeBook()
            : accessDenied();
      case 'vcr':
        (currentUser?.userRole == UserRole.admin)
            ? viewAllReciepts()
            : accessDenied();
      case 'buy':
        (currentUser?.userRole == UserRole.customer)
            ? buyBook()
            : accessDenied();
      case 'vmr':
        (currentUser?.userRole == UserRole.customer)
            ? viewReciepts()
            : accessDenied();
      default:
        unknownCommand();
    }
  }
}
