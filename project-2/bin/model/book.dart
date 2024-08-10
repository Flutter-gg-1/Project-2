import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();

class Book {
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  int quantity;
  final double price;
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      authors: List<String>.from(json['authors']),
      categories: List<String>.from(json['categories']),
      year: json['year'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "authors": authors,
      "categories": categories,
      "year": year,
      "quantity": quantity,
      "price": price
    };
  }

//methods display
  void display() {
    print(greenPen("ID:$magentaPen$id"));
    print(greenPen("Title:$magentaPen$title"));
    print(greenPen("Quantity:$magentaPen$quantity"));
    print(greenPen("Price:$magentaPen\$$price "));
  }
}
