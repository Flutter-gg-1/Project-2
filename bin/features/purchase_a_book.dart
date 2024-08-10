// Implement Operations : Buy a Book: Create a function to handle book purchases. Ensure the book is available before completing the purchase.
import 'dart:io';
import '../core/all_file.dart';

void purchaseBook() {
  print('\n Those books are available for purchase:\n');
  List<dynamic> y =
      libraryJSONData['library'].map((x) => x['quantity'] > 0).toList();
  print(y);
  for (var element in libraryJSONData['library']) {
    if (y.contains(true) && element['quantity'] != 0) {
      print(element);
    }
  }
  print('\nEnter book id for purchase of book:');
  int bookId = int.parse(stdin.readLineSync()!);
  for (var element in libraryJSONData['library']) {
    String bookIdChecked = bookId.toString();
    if (element['id'] == bookIdChecked && libraryJSONData['library'].length > 0) {
      element['quantity'] = element['quantity'] - 1;
      print('\n_____________________________\n');
      print('Book Id was $bookId\n');
      print(element);
      print('\nBook purchased successfully.\n');
      break;
    } else {
      print('Book not found.\n');
    }
  }
  customerDashboard();
}
