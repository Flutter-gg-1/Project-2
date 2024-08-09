import '../json/data.dart';
import '../global.dart';
import '../model/book.dart';

void intit() {
  data['library']?.forEach((element) {
    library.add(Book.fromJson(element));
  });

  void addBook(Book book) {
    library.add(book);
  }
}
