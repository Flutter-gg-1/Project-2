import '../model/receipt.dart';
import '../model/user.dart';
import '../utils/colorful_print.dart';
import 'library_manager.dart';

extension Customer on LibraryManager {
  // Customer
  void buyBook(
      {required User customer, required String bookId, required int quantity}) {
    var selectedBook = books.where((e) => e.id == bookId).toList().firstOrNull;
    if (selectedBook != null && (selectedBook.quantity ?? 0) >= quantity) {
      customer.bookCollection.add(selectedBook);
      reciepts.add(Receipt(
          customerId: customer.id,
          customerName: customer.name,
          bookName: selectedBook.title ?? '',
          quantity: quantity,
          price: selectedBook.price ?? 0));
    } else {
      print('Book Not Available!');
    }
  }

  void viewReciepts({required User customer}) {
    print('${customer.name} Reciepts');
    var myReciepts =
        reciepts.where((e) => e.customerId == customer.id).toList();
    if (myReciepts.isEmpty) {
      ColorfulPrint.green('You do not have any reciepts!');
    } else {
      for (var r in myReciepts) {
        r.showReceipt();
      }
    }
  }
}
