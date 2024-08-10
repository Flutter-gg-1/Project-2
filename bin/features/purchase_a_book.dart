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
}
