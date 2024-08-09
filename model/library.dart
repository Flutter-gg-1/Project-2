import 'book.dart';
import '../utils/updatedata.dart';

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

  void addBook() {
    Book newBook = Book.fromJson(Book.fillBookInformation());
    // check if book exist to increment quantity
    for (var book in books!) {
      if (book.id == newBook.id) {
        book.quantity = book.quantity! + 1;
        print('Quantity of book ${newBook.title} incremented by one');
        updateData(this, newBook, 1, true);
        return;
      }
    }

    books!.add(newBook);
    updateData(this, newBook, 1, false);
    print('Book of ID ${newBook.id} added');
  }

  void removeBook(String id) {
    // check if book exist to decrement quantity
    for (var book in books!) {
      if (book.id == id) {
        if (book.quantity == 1) {
          books!.removeWhere((book) => book.id == id);
          updateData(this, book, 2, false);
          print('Book of ID $id removed and out of stock');
          return;
        }
        book.quantity = book.quantity! - 1;
        updateData(this, book, 2, true);
        print('Quantity of book ${book.title} decremented by one');
        return;
      }
    }

    print('Book of ID $id does not exist');
  }

  void buyBook(String id) {
    // check if book exist
    for (var book in books!) {
      if (book.id == id) {
        if (book.quantity == 1) {
          books!.removeWhere((book) => book.id == id);
          updateData(this, book, 2, false);
          displayReceipt(book);
          return;
        }
        book.quantity = book.quantity! - 1;
        print('Thank you for your purchase of (${book.title})');
        updateData(this, book, 2, true);
        displayReceipt(book);
        return;
      }
    }
    print('Book of ID $id is out of stock!!');
  }

  void displayReceipt(Book book) {
    print('--- Purchase Receipt ---');
    print('Title: ${book.title}');
    print('Authors: ${book.authors?.join(', ')}');
    print('Categories: ${book.categories?.join(', ')}');
    print('Year: ${book.year}');
    print('Quantity: 1');
    print('Price: \$${book.price?.toStringAsFixed(2)}');
    print('------------------------');
  }
}
