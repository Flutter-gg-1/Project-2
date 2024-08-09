/// The `Book` class represents a book with various attributes.
///
/// Attributes:
/// - `id`: A unique identifier for the book (final).
/// - `title`: The title of the book (final).
/// - `authors`: A list of authors who wrote the book (final).
/// - `categories`: A list of categories or genres the book belongs to (final).
/// - `year`: The publication year of the book (final).
/// - `quantity`: The number of copies available (not final, as it can change).
/// - `price`: The price of the book (final).
class Book {
  final String id;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  int quantity; // Quantity can change, so it's not final :)
  final double price;

  // Constructor
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.quantity,
    required this.price,
  });

  // Factory constructor for creating a Book instance from JSON.
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      authors: List<String>.from(json['authors']),
      categories: List<String>.from(json['categories']),
      year: json['year'] as int,
      quantity: json['quantity'] as int,
      price: json['price'] as double,
    );
  }

  // Convert a Book instance to JSON.
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

  // Method to reduce quantity when a book is bought
  void buyBook() {
    if (quantity > 0) {
      quantity -= 1;
    } else {
      // To make an error :)
      throw Exception('Sorry, book is out of stock !');
    }
  }

  // Method to restock books
  void restock(int count) {
    quantity += count;
  }
}
