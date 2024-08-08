import '../json/library_data.dart';
import '../model/book.dart';
import '../model/library.dart';
import '../model/receipt.dart';

class LibraryManager {
  var library = Library.fromJson(libraryData);
  late List<Book> books;
  List<Receipt> reciepts = [];

  static var shared = LibraryManager();

  LibraryManager() {
    books = library.books as List<Book>;
  }

  void showAllBooks() {
    for (var b in books) {
      print(b.toJson());
    }
  }
}
