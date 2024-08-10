import 'dart:io';
import '../model/book.dart';
import '../model/library.dart';
import 'package:ansicolor/ansicolor.dart';
import 'adminـfunction.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();
// menu for customer
void handleCustomer(Library library) {
  while (true) {
    print(magentaPen("----------------------------------------------"));
    print(greenPen("..............Customer Menu......................"));
    print(magentaPen("----------------------------------------------"));
    print(magentaPen("1.$greenPen display our books in library"));
    print(magentaPen("2.$greenPen Buy a Book"));
    print(magentaPen("3.$greenPen View Receipt"));
    print(magentaPen("4.$greenPen Back to Main Menu"));
    stdout.write(greenPen("Choose an action: "));
    final choice = stdin.readLineSync();
    //1=> display all books
    if (choice == "1") {
      library.displayAllBooks();
      //user went buy book
    } else if (choice == "2") {
      stdout.write(bluePen("Enter book ID to buy: "));
      var id = stdin.readLineSync()!;
      var bookIndex = library.books.indexWhere((book) => book.id == id);
      if (bookIndex == -1) {
        print(yalowPen("Book not found."));
        print(blackPen(
            "......................................................................."));
      } else {}
      var book = library.books[bookIndex];
      if (book.quantity == 0) {
        print(yalowPen("Sorry, this book is out of stock."));
        print(blackPen(
            "......................................................................."));
      } else {}
      book.quantity -= 1;

      var purchasedBook = Book(
          id: book.id,
          title: book.title,
          quantity: 1,
          price: book.price,
          year: book.year,
          categories: book.categories,
          authors: book.authors);
      purchasedBooks.add(purchasedBook);
      //calculated total .
      totalAmount += purchasedBook.price;
      print(greenPen("Book purchased successfully."));
      print(bluePen("Receipt:"));
      print(bluePen("Title: ${book.title}"));
      print(bluePen("Price: \$${book.price}"));
      print(blackPen(
          "......................................................................."));
    } else if (choice == "3") {
      displayReceipts();
    } else if (choice == "4") {
      break;
    } else {
      print(yalowPen("Invalid choice. Please try again."));
    }
  }
}
