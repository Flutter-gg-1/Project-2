import 'dart:io';

class Book {
  String? id;
  String? title;
  List<dynamic>? authors;
  List<dynamic>? categories;
  int? year;
  int? quantity;
  double? price;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity,
      required this.price});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        authors: json['authors'],
        categories: json['categories'],
        year: json['year'],
        quantity: json['quantity'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'categories': categories,
      'year': year,
      'quantity': quantity,
      'price': price
    };
  }

  static Map<String, dynamic> fillBookInformation() {
    Map<String, dynamic> bookInfo = {};

    print('Fill the following book info:');

    stdout.write('ID: ');
    bookInfo['id'] = stdin.readLineSync();

    stdout.write('Title: ');
    bookInfo['title'] = stdin.readLineSync();

    stdout.write('Authors (separated by comma): ');
    String? authorsInput = stdin.readLineSync();
    bookInfo['authors'] =
        authorsInput?.split(',').map((author) => author.trim()).toList();

    stdout.write('Categories (separated by comma): ');
    String? categoriesInput = stdin.readLineSync();
    bookInfo['categories'] =
        categoriesInput?.split(',').map((category) => category.trim()).toList();

    stdout.write('Year: ');
    bookInfo['year'] = int.tryParse(stdin.readLineSync() ?? '');

    stdout.write('Quantity: ');
    bookInfo['quantity'] = int.tryParse(stdin.readLineSync() ?? '');

    stdout.write('Price: ');
    bookInfo['price'] = double.tryParse(stdin.readLineSync() ?? '');

    return bookInfo;
  }

  Map<String, dynamic> displayBookBought(Book book) {
    return {
      'id': book.id,
      'title': book.title,
      'authors': book.authors,
      'categories': book.categories,
      'year': book.year,
      'quantity': 1,
      'price': book.price?.toStringAsFixed(2)
    };
  }
}
