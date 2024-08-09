import '../core/all_file.dart';
import 'dart:io';

void mainDashboard() {
  // Main Dashboard to select Admin or Customer from here
  print(
      '\n_____________________#### Main Dashboard ####_____________________\n');
  print('___________________#### Book Store ####_____________________');
  print('Welcome to our library. What would you like to do today?');
  print('Please sign in to your account.\n');
  print('Sign in as ; 1. Admin 2. User');
  try {
    int signInAs = int.parse(stdin.readLineSync()!);
    switch (signInAs) {
      case 1:
        adminDashboard();
        break;
      case 2:
        customerDashboard();
        break;
      default:
        print('Invalid input. Please try again.');
        showPrompt();
        break;
    }
  } catch (e) {
    print('Invalid input...${e.toString()}. Please try again.');
    showPrompt();
  }
}
