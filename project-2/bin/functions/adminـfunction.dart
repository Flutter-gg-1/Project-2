import 'dart:io';
import '../model/book.dart';
import '../model/library.dart';
import 'package:ansicolor/ansicolor.dart';


final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();



List<Book> purchasedBooks = [];
 double totalAmount = 0.0;
 // view receipts
  void displayReceipts() {
  if (purchasedBooks.isEmpty) {
    print(yalowPen("No purchases yet."));
  } else {
    for (var book in purchasedBooks) {
      book.display();
      print(blackPen(
          "......................................................................."));
    }
    print('Total Amount: \$$totalAmount');
  }
}
// menu for Admin
void handleAdmin(Library library) {
  while (true) {
    print(magentaPen("----------------------------------------------"));
    print(greenPen("..............Admin Menu......................"));
    print(magentaPen("----------------------------------------------"));
    print(magentaPen("1.$greenPen Add a Book"));
    print(magentaPen("2.$greenPen Remove a Book"));
    print(magentaPen("3.$greenPen view all books "));
    print(magentaPen("4.$greenPen View Receipt "));
    print(magentaPen("5.$greenPen Back to Main Menu"));
    stdout.write(magentaPen("$greenPen * Choose action: "));

    final choice = stdin.readLineSync();
    if (choice == "1") {
      print(bluePen("Enter book details:"));
      stdout.write(bluePen("ID book: "));
      var id = stdin.readLineSync()!;
      stdout.write(bluePen("Title book: "));
      var title = stdin.readLineSync()!;
      stdout.write(bluePen("Authors (comma separated): "));
      var authors =
          stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();
      stdout.write(bluePen("Categories (comma separated): "));
      var categories =
          stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();
      stdout.write(bluePen("Year: "));
      var year = int.tryParse(stdin.readLineSync()!) ?? 0;
      stdout.write(bluePen("Quantity : "));
      var quantity = int.tryParse(stdin.readLineSync()!) ?? 0;
      stdout.write(bluePen("Price: "));
      var price = double.tryParse(stdin.readLineSync()!) ?? 0.0;
      if (id.isEmpty ||
          title.isEmpty ||
          authors.isEmpty ||
          categories.isEmpty ||
          year <= 0 ||
          quantity <= 0 ||
          price <= 0) {
        print(yalowPen(
            "Invalid input. Please make sure all fields are filled out correctly."));
        print(blackPen( "......................................................................."));
        return;}
      
      library.addBook(Book(
          id: id,
          title: title,
          authors: authors,
          categories: categories,
          year: year,
          quantity: quantity,
          price: price));
          // if removed books
    } else if (choice == "2") {
      stdout.write(bluePen("Enter book ID to removed: "));
      var id = stdin.readLineSync()!;
      var success = library.removeBook(id);
      if (success) {
        print(greenPen("Book removed successfully."));
        print(blackPen(
            "......................................................................."));
      } else {
        print(yalowPen("Book not found."));
        print(blackPen("......................................................................."));
      }
    } else if (choice == "3") {
      library.displayAllBooks();
    } else if (choice == '4') {
      displayReceipts();
    } else if (choice == "5") {
      break;
    } else {
      print(yalowPen("Invalid choice. Please try again."));
      print(blackPen( "......................................................................."));
    }
  }
}


  
