import '../json/data.dart';
import '../global.dart';
import '../model/book.dart';

void intitLibrary() {
  for (var element in data['library']!) {
    library.add(Book.fromJson(element));
  }
}

void addBook(Book book) {
  book.id = (int.parse(library.last.id) + 1).toString();
  library.add(book);
}

void removeBook(String id) {
  for (var book in library) {
    if (id == book.id) {
      library.remove(book);
    }
  }
}
