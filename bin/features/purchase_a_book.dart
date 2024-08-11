// Implement Operations : Buy a Book: Create a function to handle book purchases. Ensure the book is available before completing the purchase.
import '../core/all_file.dart';

void purchaseBook() {
  print('\n Those books are available for purchase:\n');
  List<dynamic> y =
      libraryJSONData['library'].map((x) => x['quantity'] > 0).toList();
  for (var element in libraryJSONData['library']) {
    if (y.contains(true) && element['quantity'] != 0) {
      print(element);
    }
  }
  print('\nEnter book id for purchase of book:');
  enterBookIdForPurchaseMethod();
  customerDashboard();
}
