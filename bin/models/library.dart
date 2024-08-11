import 'dart:math';
import 'book.dart';
import 'receipt.dart';

class Library {
  List<Book> books; // List to hold the collection of books
  List<Receipt> receipts = []; // Global list to store all receipts

  Library({required this.books});

  // Factory constructor to create a Library instance from JSON data
  factory Library.fromJson(Map<String, dynamic> json) {
    var booksJson = json['library'] as List;
    List<Book> booksList =
        booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();
    return Library(books: booksList);
  }
// Convert the Library instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'library': books.map((book) => book.toJson()).toList(),
    };
  }

  // Print details of all books in the library
  void printAllbooks() {
    // foreach to print all books
    books.forEach((element) {
      print('======= Book ${element.id} =======');
      print('id: ${element.id}');
      print('title: ${element.title}');
      print('authors: ${element.authors.toString()}');
      print('categories: ${element.categories.toString()}'); // TODO its a list
      print('quantity: ${element.quantity}');
      print('year: ${element.year}');
    });
  }

// Add a new book to the library
  void addBook(Book book) {
    books.add(book);
  }

  // Remove a book from the library by its ID
  void removeBook(String id) {
    books.removeWhere((book) => book.id == id);
  }

  // Handle the purchase of a book by its ID
  //========================================================
  // bool buyBook(String id) {
  //   for (var book in books) {
  //     // Genrate recipe id
  //     int receiptId = Random().nextInt(100000);
  //     List<Receipt> lisrec = [];
  //     if (book.id == id && book.quantity > 0) {
  //       book.quantity--;
  //       Map<String, dynamic> receipt = {
  //         'receiptId': receiptId, // Store the receipt ID
  //         'id': book.id, // Store the book ID
  //         'title': book.title, // Store the book title
  //         'authors': book.authors, // Store the book authors
  //         'categories': book.categories, // Store the book categories
  //         'year': book.year, // Store the publication year
  //         'price': book.price, // Store the book price
  //       };
  //       lisrec = receipt as List;
  //       displayReceipt(receipt);
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  bool buyBook(String id) {
    for (var book in books) {
      if (book.id == id && book.quantity > 0) {
        book.quantity--;

        // Create a new Receipt object and add it to the receipts list
        Receipt receipt = Receipt(
          bookId: book.id,
          title: book.title,
          authors: book.authors,
          categories: book.categories,
          year: book.year,
          price: book.price,
        );

        receipts.add(receipt);

        // Display the receipt details
        receipt.displayReceipt();

        return true;
      }
    }
    return false;
  }

  void displayAllReceipts() {
    if (receipts.isEmpty) {
      print('No receipts available.');
    } else {
      for (var receipt in receipts) {
        receipt.displayReceipt();
      }
    }
  }

  //===========================================================
  // Print the details of a purchase receipt

  displayReceipt(Map<String, dynamic> receipt) {
    print('----------------------------------------');
    print('Receipt:${receipt['receiptId']} ======');
    print('Title: ${receipt['title']}');
    print('uthors: ${receipt['authors']}');
    print('categories: ${receipt['categories']}');
    print('price: ${receipt['price']}');
    print('----------------------------------------');
  }
}
