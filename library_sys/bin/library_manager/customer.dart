import '../model/book.dart';
import '../model/receipt.dart';
import '../model/user.dart';
import 'library_manager.dart';

extension Customer on LibraryManager {
  // Customer
  void buyBook(
      {required User customer, required Book book, required int quantity}) {
    var selectedBook = books.where((e) => e == book).toList().firstOrNull;
    if (selectedBook == null) {
      print('Book not available!');
    } else {
      customer.bookCollection.add(book);
      reciepts.add(Receipt(
          customerName: customer.name,
          bookName: book.title ?? '',
          quantity: quantity,
          price: book.price ?? 0));
      print('Book Purchased');
    }
  }

  void viewReciepts({required User customer}) {
    var myReciepts =
        reciepts.where((e) => e.customerName == customer.name).toList();
    myReciepts.map((e) => e.showReceipt());
  }
}
