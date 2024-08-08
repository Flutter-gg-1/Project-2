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

  addBook(Book book) {
    library.add(book);
  }

  removeBook(String id) {
    Book? value;
    library.forEach((element) {
      if (element.id == id) {
        value = element;
      }
    });
    library.remove(value);
  }
}

class Book {
  final String id;
  final String title;
  final List authors;
  final List categories;
  final int year;
  final int quantity;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.categories,
      required this.year,
      required this.quantity});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        title: json["title"],
        authors: json["authors"],
        categories: json["categories"],
        year: json["year"],
        quantity: json["quantity"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "authors": authors,
      "categories": categories,
      "year": year,
      "quantity": quantity
    };
  }
}
