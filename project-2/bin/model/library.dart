import 'book.dart';
import '../data/dateSet.dart';

import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen blackPen = AnsiPen()..black();
final AnsiPen grayPen = AnsiPen()..gray();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();

class Library {
  final List<Book> books;

  Library({
    required this.books,
  });

  factory Library.fromJson(Map<String, dynamic> json) {
    List<Book> list = [];
    for (var element in dataLibrary["library"]) {
      Book.fromJson(element);
      list.add(Book.fromJson(element));
    }
    return Library(books: list);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["library"] = books.map((element) => element.toJson()).toList();
    return data;
  }

  void displayAllBooks() {
    if (books.isEmpty) {
      print(yalowPen('No books available.'));
      return;
    }

    print(magentaPen("......................................................"));
    print(magentaPen("......................................................"));
    print(greenPen("--------------------- ALL Books ----------------------"));
    print(magentaPen("......................................................"));
    for (var book in books) {
      print(bluePen("ID: $greenPen ${book.id}"));
      print(bluePen("Title: $greenPen${book.title}"));
      print(bluePen("Authors:$greenPen ${book.authors.join(", ")}"));
      print(bluePen("Categories:$greenPen ${book.categories.join(", ")}"));
      print(bluePen("Year:$greenPen ${book.year}"));
      print(bluePen("Price:$greenPen \$${book.price}"));
      print(bluePen("Quantity Available: $greenPen${book.quantity}"));
      print(blackPen(
          "......................................................................."));
    }
  }

  //حطيت الميثود الاضافه والحذف
  void addBook(Book book) {
    books.add(book);
    print(greenPen("Book added successfully."));
    print(blackPen(
        "......................................................................."));
  }

  bool removeBook(String id) {
    var bookIndex = books.indexWhere((book) => book.id == id);
    if (bookIndex != -1) {
      books.removeAt(bookIndex);
      return true;
    }
    return false;
  }
}


