class Book {
  String? id;
  String? title;
  List<String>? authors;
  List<String>? categories;
  int? year;
  int? quantity;
  double? price;

  Book(
      {this.id,
      this.title,
      this.authors,
      this.categories,
      this.year,
      this.quantity,
      this.price});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      authors: json['authors'],
      categories: json['categories'],
      year: json['year'],
      quantity: json['quantity'],
      price: json['price'],
    );
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

  // Predefined Book
  static var book1 = Book(
      id: '99',
      title: 'New Book',
      authors: ['Charles Dickens'],
      categories: ['Novel'],
      year: 2024,
      quantity: 8,
      price: 12.5);
}
