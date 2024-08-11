import 'dart:io';
import 'all_file.dart';

void showPrompt() {
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

void enterBookIdForPurchaseMethod() {
  int bookId = int.parse(stdin.readLineSync()!);
  for (var element in libraryJSONData['library']) {
    String bookIdChecked = bookId.toString();
    if (element['id'] == bookIdChecked &&
        libraryJSONData['library'].length > 0) {
      element['quantity'] = element['quantity'] - 1;
      print('\n_____________________________\n');
      print('Book Id was $bookId\n');
      print('\nBook purchased successfully.\n');
      purchaseINFO.add(element);
      print(purchaseINFO);
      break;
    } else {
      print('Book not found.\n');
    }
  }
}
