// Key Of library
import 'authors_key.dart';
import 'categories_key.dart';
class KeyOfLibrary {
  final String id;
  final String title;
  final List<Authors> authors;
  final List<Categories> categories;
  final int year;
  final int quantity;
  final double price;
  KeyOfLibrary({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });
  // Factory Constructor to create a KeyOfLibrary object from a JSON map
  factory KeyOfLibrary.fromJson(Map<String, dynamic> json) {
    return KeyOfLibrary(
      id: json['id'],
      title: json['title'],
      authors: List<Authors>.from(json['authors'].map((x) => Authors.fromJson(x))),
      categories: List<Categories>.from(json['categories'].map((x) => Categories.fromJson(x))),
      year: json['year'],
      quantity: json['quantity'],
      price: json['price'],
    );
  } 
  // Method to convert a KeyOfLibrary object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'categories': categories,
      'year': year,
      'quantity': quantity,
      'price': price,
    };
  }
}