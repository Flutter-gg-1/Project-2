import 'Models/library.dart';
import 'Models/book.dart';
import 'data_set.dart';

void main(List<String> arguments) {
  Library library = Library.fromJson(data);
  Book book = Book(
      id: "6",
      title: "title",
      authors: ["george martin"],
      categories: ["categories"],
      year: 1990,
      quantity: 5,
      price: 19.99);
  library.addBook(book);
  library.printAllBooks();
}
