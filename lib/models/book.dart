// class to represent book in library
class Book {
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  int quantity;
  final double price;

  Book(
      {required this.authors,
      required this.categories,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.year});

  factory Book.fromJson(Map<String, dynamic> json) {
    List<String> authorsList = [];
    for(var author in json['authors']) {
      authorsList.add(author);
    }
    return Book(
        authors: authorsList,
        categories: json['categories'],
        id: json['id'],
        price: json['price'],
        quantity: json['quantity'],
        title: json['title'],
        year: json['year']);
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
