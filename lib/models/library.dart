import 'dart:convert';
import 'book.dart';
import '../utils/json_manager.dart';

class LibraryService {
  List<Book> _books = [];

  // Constructor
  LibraryService() {
    _loadBooks();
  }

  // Load books from JSON file
  void _loadBooks() {
    final jsonData = JsonManager.readJson('data/library.json');
    _books = (jsonDecode(jsonData)['library'] as List)
        .map((bookJson) => Book.fromJson(bookJson))
        .toList();
  }

  // Add a book to the library
  void addBook(Book book) {
    _books.add(book);
    _saveBooks();
  }

  // Remove a book from the library
  void removeBook(String id) {
    _books.removeWhere((book) => book.id == id);
    _saveBooks();
  }

  // Buy a book from the library
  bool buyBook(String id) {
    final book = _books.firstWhere((book) => book.id == id,
        orElse: () => throw Exception('Book not found'));
    if (book.quantity > 0) {
      book.quantity--;
      _saveBooks();
      return true;
    }
    return false;
  }

  // Save the updated list of books back to JSON file
  void _saveBooks() {
    final jsonData =
        jsonEncode({'library': _books.map((book) => book.toJson()).toList()});
    JsonManager.writeJson('data/library.json', jsonData);
  }

  // Display a receipt for the purchased book
  void displayReceipt(Book book) {
    print('Receipt:');
    print('Book: ${book.title}');
    print('Price: \$${book.price}');
  }
}
