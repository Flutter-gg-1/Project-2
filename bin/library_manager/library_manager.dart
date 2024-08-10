import '../json/library_data.dart';
import '../model/book.dart';
import '../model/library.dart';
import '../model/receipt.dart';
import '../utils/colorful_print.dart';

class LibraryManager {
  var library = Library.fromJson(libraryData);
  late List<Book> books;
  late String lastBookId;
  List<Receipt> reciepts = [];

  LibraryManager() {
    books = library.books as List<Book>;
    books.sort((b1, b2) => int.parse(b1.id!).compareTo(int.parse(b2.id!)));
    lastBookId = books.last.id ?? '0';
  }

  void showAllBooks() {
    for (var b in books) {
      ColorfulPrint.cyan(b.toJson().toString());
    }
  }
}
