import 'dart:io';
import '../core/all_file.dart';

void customerDashboard(){
  print('\n_____________#### Customer Dashboard ####_____________\n');
  print('1. Purchase a book, 2. Show receipt, 3. Exit');
  try {
    int customerOption = int.parse(stdin.readLineSync()!);
    switch (customerOption) {
      case 1:
        purchaseBook();
        break;
      case 2:
        showReceipt();
        break;
      case 3:
        print('Bye.');
        exit(0);
      default:
        print('Invalid input. Please try again.');
        customerDashboard();
        break;
    }
  } catch (e) {
    print('Invalid input...${e.toString()}. Please try again.');
    customerDashboard();
  }

}