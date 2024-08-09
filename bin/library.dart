class Library {
  List<Book>? books;

  Library({required this.books});

  factory Library.fromJson(Map<String, dynamic> json) {
    List<Book> books =
        (json['library'] as List).map((book) => Book.fromJson(book)).toList();
    return Library(books: books);
  }

  Map<String, dynamic> toJson() {
    return {'library': books!.map((book) => book.toJson()).toList()};
  }
}

class Book {
  String? id;
  String? title;
  List<String>? authors;
  List<String>? categories;
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
}
