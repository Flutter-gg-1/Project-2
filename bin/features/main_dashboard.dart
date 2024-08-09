import '../core/all_file.dart';
import 'dart:io';

void mainDashboard() {
  print(
      '\n_____________________#### Main Dashboard ####_____________________\n');
  print('___________________#### Book Store ####_____________________');
  print('Welcome to our library. What would you like to do today?');
  print('Please sign in to your account.\n');
  print('Sign in as ; 1. Admin 2. User');
  int signInAs = int.parse(stdin.readLineSync()!);
  switch (signInAs) {
    case 1:
      break;
    case 2:
      break;
    default:
      print('Invalid input. Please try again.');
      mainDashboard();
      break;
  }
}
