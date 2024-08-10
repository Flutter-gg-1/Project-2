class Library {
  List<Book> books;

  Library({required this.books});

  factory Library.fromJson(Map<String, dynamic> map) {
    return Library(
        books: List<Book>.from(map["library"].map((x) => Book.fromJson(x))));
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
  Book(this.id, this.title, this.authors, this.categories, this.year,
      this.quantity, this.price);

  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
        map["id"],
        map["title"],
        List<String>.from(map["authors"]),
        List<String>.from(map["categories"]),
        map["year"],
        map["quantity"],
        map["price"]);
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
}
