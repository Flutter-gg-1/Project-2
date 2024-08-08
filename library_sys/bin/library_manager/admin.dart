import '../model/book.dart';
import 'library_manager.dart';

extension Admin on LibraryManager {
  // Admin
  void addBook(Book book) => books.add(book);

  void removeBook(Book book) => books.remove(book);

  void showAllReciept() {
    print('All Reciepts');
    for (var r in reciepts) {
      r.showReceipt();
    }
  }
}
