import 'dart:io';

import '../library_manager/library_manager.dart';
import '../model/user.dart';
import 'home_print_msg.dart';

class Home {
  var mgr = LibraryManager.shared;
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

  void homeScreen() {
    homeIndicatorMsg();
    var userInput = stdin.readLineSync();
    switch (userInput) {
      case 'i':
        commandsInstructions();
      case 'q':
        terminateMsg();
        terminateApp = true;
      case 'add':
        (currentUser?.userRole == UserRole.admin) ? print('') : accessDenied();
      case 'rm':
        (currentUser?.userRole == UserRole.admin) ? print('') : accessDenied();
      case 'vra':
        (currentUser?.userRole == UserRole.admin) ? print('') : accessDenied();
      case 'buy':
        (currentUser?.userRole == UserRole.customer)
            ? print('')
            : accessDenied();
      case 'vr':
        (currentUser?.userRole == UserRole.customer)
            ? print('')
            : accessDenied();
      default:
        unknownCommand();
    }
  }
}
