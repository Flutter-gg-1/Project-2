import 'book_model.dart';

//model library
class Library {
  final List<Book> library;

  Library({required this.library});

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        library: List.from(json["library"]).map((element) {
      return Book.fromJson(element);
    }).toList());
  }

  Map<String, dynamic> toJson() {
    return {"library": library.map((e) => e.toJson()).toList()};
  }
}
