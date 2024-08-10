import 'book.dart';
/**
 * This class is about a collection of books
 */
class Library {
    final List<Book> books;
    // constructor
    Library({
        required this.books,
    });
    // factory cinstructor to convert Json data to object
    factory Library.fromJson(Map<String, dynamic> json){ 
        return Library(
            books: json["library"] == null ? [] : List<Book>.from(json["library"]!.map((e) => Book.fromJson(e))),
        );
    }
    // convert an object to Json format
    Map<String, dynamic> toJson() => {
        "library": books.map((e) => e.toJson()).toList(),
    };

}
