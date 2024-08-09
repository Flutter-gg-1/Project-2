import 'book.dart';

class Library {
    final List<Book> books;

    Library({
        required this.books,
    });

    factory Library.fromJson(Map<String, dynamic> json){ 
        return Library(
            books: json["library"] == null ? [] : List<Book>.from(json["library"]!.map((e) => Book.fromJson(e))),
        );
    }

    Map<String, dynamic> toJson() => {
        "library": books.map((e) => e.toJson()).toList(),
    };

}
