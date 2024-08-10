import 'dart:io';
import 'user.dart';
import 'admin.dart';

class Accounts {
  void logIn() {
    print("Log in");

    print("Please enter your username:");
    String? username = stdin.readLineSync()?.trim();

    if (username == "") {
      print("Username cannot be empty. Please try again.");
      return;
    }

    print("Please enter your password:");
    String? password = stdin.readLineSync()?.trim();

    if (password == "") {
      print("Password cannot be empty. Please try again.");
      return;
    }

    try {
      if (username == "admin" && password == "admin") {
        print("Admin logged in\n");
        AdminPermissions().adminInput();
      } else if (username == "user" && password == "user") {
        print("User logged in\n");
        UserPermissions().userInput();
      } else {
        print("Invalid username or password. Please try again.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void signOut() {
    print("You are signed out\n");
    logIn();
  }
}
