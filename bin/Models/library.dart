import 'book.dart';

class Library {
  List<Book> books;

  Library({required this.books});

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        books: List.from(json["library"]).map((element) {
      return Book.fromJson(element);
    }).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      "library": books.map((element) {
        return element.toJson();
      })
    };
  }
}
