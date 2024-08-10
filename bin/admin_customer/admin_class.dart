import 'dart:io';
import '../core/all_file.dart';

void adminDashboard() {
  print('\n_____________#### Admin Dashboard ####_____________\n');
  print('Please select one of the following options:');
  print('1. Add new books, 2. Show receipt');
  print('3. Remove book, 4. Main Dashboard, 5. Exit');
  try {
    int adminOption = int.parse(stdin.readLineSync()!);
    switch (adminOption) {
      case 1:
        addNewBook();
        break;
      case 2:
        showReceipt();
        break;
      case 3:
        removeBook();
        break;
      case 4:
        mainDashboard();
        break;
      case 5:
      print('Bye.');
        exit(0);
      default:
        print('Invalid input. Please try again.');
        adminDashboard();
        break;
    }
  } catch (e) {
    print('Invalid input...${e.toString()}. Please try again.');
    adminDashboard();
  }
}
