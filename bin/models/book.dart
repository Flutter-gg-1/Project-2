// Define the attributes of the Book class
class Book {
  String id;
  String title;
  List<String> authors;
  List<String> categories;
  int year;
  int quantity;
  double price;
// Constructor for creating a new Book instance
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });
  // Factory constructor to create a Book instance from a JSON map
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
// Method to convert the Book instance to a JSON map
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
