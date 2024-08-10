import '../utils/updateuser.dart';
import 'book.dart';
import '../utils/updatedata.dart';
import 'user/user.dart';
import '../bin/library_system.dart';

class Library {
  List<Book> books;

  Library(this.books);

  factory Library.fromJson(Map<String, dynamic> json) {
    List<Book> books =
        (json['library'] as List).map((book) => Book.fromJson(book)).toList();
    return Library(books);
  }

  Map<String, dynamic> toJson() {
    return {'library': books.map((book) => book.toJson()).toList()};
  }

  void addBook() {
    Book newBook;
    try {
  newBook = Book.fromJson(Book.fillBookInformation());
} catch (e) {
  rethrow;
}
    // check if book exist to increment quantity
    for (var book in books) {
      if (book.id == newBook.id &&
          book.title == newBook.title &&
          book.year == newBook.year) {
        book.quantity = (book.quantity ?? 0) + (newBook.quantity ?? 0);
        print(green('Quantity of book (${newBook.title}) incremented'));
        updateData(this, newBook, 1, true);
        return;
      }
    }

    books.add(newBook);
    updateData(this, newBook, 1, false);
    print(green('Book of ID (${newBook.id}) added'));
  }

  void removeBook(String id) {
    if(id.isEmpty){
      throw Exception(red('No Value in book ID!!'));
    }
    for (var book in books) {
      if (book.id == id) {
        books.removeWhere((book) => book.id == id);
        updateData(this, book, 2, false);
        print(green('Book of ID ($id) removed from the Library'));
        return;
      }
    }
    print(color('Book of ID ($id) does not exist'));
  }

   buyBook({required User user,required String bookId}) async{
    if(bookId.isEmpty){
      throw Exception(red('No Value in book ID!!'));
    }
    // check if book exist to decrement quantity
    for (var book in books) {
      if (book.id == bookId) {
        if (book.quantity != 0) {
          book.quantity = book.quantity! - 1;
          print(green('Thank you for your purchase of (${book.title})'));
          updateData(this, book, 2, true);
          displayReceipt(book);
          updateUser(user, book: book);
          return;
        }else{
          print(blue('Book of ID ($bookId) is out of stock!!'));
          return;
        }
      }
    }
    print(color('Book of ID ($bookId) does not exist!!'));
  }

  void displayReceipt(Book book) {
    print(gold('Purchase Receipt'));
    print(gold('------------------------'));
    print(gold('Title: ${book.title}'));
    print(gold('Authors: ${book.authors?.join(', ')}'));
    print(gold('Categories: ${book.categories?.join(', ')}'));
    print(gold('Year: ${book.year}'));
    print(gold('Quantity: 1'));
    print(gold('Price: \$${book.price?.toStringAsFixed(2)}'));
    print(gold('------------------------'));
  }

   displayAllBooks(){
    print(color('\n--- Available Books ---'));
    for (var book in books) {
      print(highlight('Book ID: ${book.id}'));
      print(highlight('Book title: ${book.title}'));
      print(highlight('Book authors: ${book.authors}'));
      print(highlight('Book categories: ${book.categories}'));
      print(highlight('Book year: ${book.year}'));
      print(highlight('Book quantity: ${book.quantity}'));
      print(highlight('Book price: ${book.price}'));
      print('');
    }
  }
}
