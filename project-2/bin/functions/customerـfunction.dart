import 'dart:io';
import '../model/book.dart';
import '../model/library.dart';
import 'package:ansicolor/ansicolor.dart';
import 'adminـfunction.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();
//في حال ادخل المستخدم ٢ راح ينقله الي هذا المحتوى
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
    if (choice == "1") {
      //للعرض جميع الكتب
      library.displayAllBooks();
    } else if (choice == "2") {
      //لشراء
      stdout.write(bluePen("Enter book ID to buy: "));
      var id = stdin.readLineSync()!;
      var bookIndex = library.books.indexWhere((book) => book.id == id);
      if (bookIndex == -1) {
        print(yalowPen("Book not found."));
        print(blackPen(
            "......................................................................."));
      } else {
        var book = library.books[bookIndex];
        //اذا الكميه صفر راح يطبع له رساله
        if (book.quantity == 0) {
          print(yalowPen("Sorry, this book is out of stock."));
          print(blackPen(
              "......................................................................."));
        } else {
          int index =
              purchasedBooks.indexWhere((element) => element.id == book.id);
          book.quantity -= 1;
          if (index >= 0) {
            purchasedBooks[index].quantity++;
          } else {
            //هنا يخزن كتب عشان يحسب كم من مشتريات
            var purchasedBook = Book(
              id: book.id,
              title: book.title,
              quantity: 1,
              price: book.price,
              year: book.year,
              categories: book.categories,
              authors: book.authors,
            );
            purchasedBooks.add(purchasedBook);
          }
          print(greenPen("Book purchased successfully."));
          print(bluePen("Receipt:"));
          print(bluePen("Title: ${book.title}"));
          print(bluePen("Price: \$${book.price}"));
          print(blackPen(
              "......................................................................."));
        }
      }
    } else if (choice == "3") {
      // يعرض له جميع مشتريات
      displayReceipts();
    } else if (choice == "4") {
      break;
    } else {
      //ادخل يوزر رقم غلط
      print(yalowPen("Invalid choice. Please try again."));
    }
  }
}
