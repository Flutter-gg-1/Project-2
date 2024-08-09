import '../model/book.dart';
import '../utils/colorful_print.dart';
import 'library_manager.dart';

extension Admin on LibraryManager {
  // Admin
  void addBook(Book book) => books.add(book);

  void removeBook(Book book) => books.remove(book);

  void viewAllReciepts() {
    ColorfulPrint.magenta('All Reciepts');
    if (reciepts.isEmpty) {
      ColorfulPrint.green('No Reciepts to show!');
    } else {
      for (var r in reciepts) {
        r.showReceipt();
      }
    }
  }
}
