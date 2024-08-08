import 'book.dart';

class Library {
  List books;

  Library({required this.books});

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        books: (json['library'] as List).map((e) => Book.fromJson(e)).toList());
  }
}
