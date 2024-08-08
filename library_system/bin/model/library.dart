class Library {
  List<Book> book;

  Library({required this.book});

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        book: json["library"].map<Book>((element) {
      return Book.fromJson(element);
    }).toList());
  }
}

class Book {
  String id;
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

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        title: json["title"],
        authors: json["authors"],
        categories: json["categories"],
        year: json["year"],
        quantity: json["quantity"],
        price: json["price"]);
  }
}
