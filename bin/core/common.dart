import 'dart:io';
import 'all_file.dart';

void showPrompt(){
  // Show Prompt for both Admin or Customer
  print('Do you want to continue? (y/n)');
  String? input = stdin.readLineSync();
  switch (input) {
    case 'y' || 'Y':
      print('Continue... Going to main dashboard');
      mainDashboard();
      break;
    case 'n' || 'N':
      print('Bye.');
      exit(0);
    default:
      print('Invalid input. Please try again.');
      showPrompt();
      break;
  }
}
//_________________________________________________________
  // Show Prompt for Admin user
  void adminPrompt(){
    print('Admin Prompt');

  }

  //_________________________________________________________
  // Show Prompt for Customer user
  void customerPrompt(){
    print('Customer Prompt');
  }