import 'dart:math';
import '../data_set.dart';

class Book {
  String? id;
  String title;
  List<String> authors;
  List<String> categories;
  int year;
  int quantity;
  double price;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price});

  Book.withoutId(
      {required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price}) {
    Random random = Random();
    int genId = random.nextInt(1000);
    id = genId.toString();
    bool isValid = false;
    //checking if the id is duplicated
    while (!isValid) {
      int genId = random.nextInt(1000);
      id = genId.toString();
      isValid = true;
      for (var book in library.books) {
        if (id == book.id) {
          isValid = false;
          break;
        }
      }
    }
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        authors: json['authors'].cast<String>(),
        categories: json['categories'].cast<String>(),
        year: json['year'],
        quantity: json['quantity'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['authors'] = authors;
    data['categories'] = categories;
    data['year'] = year;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
