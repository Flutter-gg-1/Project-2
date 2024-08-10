import 'dart:io';
import 'user.dart';
import 'admin.dart';
import '../lib/helpers/color_print.dart';

class Accounts {
  void logIn() {
    printInfo("Log in");

    printInfo("Please enter your username:");
    String? username = stdin.readLineSync()?.trim();

    if (username == "") {
      printWarning("Username cannot be empty. Please try again.");
      return;
    }

    printInfo("Please enter your password:");
    String? password = stdin.readLineSync()?.trim();

    if (password == "") {
      printWarning("Password cannot be empty. Please try again.");
      return;
    }

    try {
      if (username == "admin" && password == "admin") {
        printSuccess("Admin logged in\n");
        AdminPermissions().adminInput();
      } else if (username == "user" && password == "user") {
        printSuccess("User logged in\n");
        UserPermissions().userInput();
      } else {
        printWarning("Invalid username or password. Please try again.");
      }
    } catch (e) {
      printError("Error: $e");
    }
  }

  void signOut() {
    printInfo("You are signed out\n");
    logIn();
  }
}
