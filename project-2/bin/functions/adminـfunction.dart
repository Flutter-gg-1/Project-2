 import 'dart:io';
import '../model/book.dart';
import '../model/library.dart';
import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();
// لعرض فاتوره مع حساب المجموع 
List<Book> purchasedBooks = [];
void displayReceipts() {
  if (purchasedBooks.isEmpty) {
    print(yalowPen("No purchases yet."));
  } else {
    double totalAmount = 0.0;
    for (var book in purchasedBooks) {
      totalAmount += book.price * book.quantity;
      book.display();
      print(blackPen(
          "......................................................................."));
    }
    print('Total Amount: \$$totalAmount');
  }
}

void handleAdmin(Library library) {
  while (true) {
    //في حال ادخل المستخدم ١ راح ينقله الي هذا المحتوى

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
    //لاضافه كتاب جديد 
    if (choice == "1") {
      print(bluePen("Enter book details:"));
      stdout.write(bluePen("ID book: "));
      var id = stdin.readLineSync()!;
      int index = library.books.indexWhere((element) => element.id == id);
      if (index >= 0) {

//في حال ادخل الادمن اي دي موجود من قبل تظهر له رساله 
        print(yalowPen("This book's id is already exist."));
      } else {
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
              //اذا ادخل الادمن مثلا في خانه السنه نص ما ادخل رقم راح تظهر له رساله
          print(yalowPen("Invalid input. Please make sure all fields are filled out correctly."));
          print(blackPen(
              "......................................................................."));
              // غير ذالك راح يتم اضافه الكتاب 
        } else {
          library.addBook(Book(
            id: id,
            title: title,
            authors: authors,
            categories: categories,
            year: year,
            quantity: quantity,
            price: price,
          ));
        }
      }
      //للحذف كتاب 
    } else if (choice == "2") {
      stdout.write(bluePen("Enter book ID to removed: "));
      var id = stdin.readLineSync()!;
      var success = library.removeBook(id);
      if (success) {
        print(greenPen("Book removed successfully."));
        print(blackPen(
            "......................................................................."));
      } else {
        //اذا ما حصل على اي دي 
        print(yalowPen("Book not found."));
        print(blackPen(
            "......................................................................."));
      }
    } else if (choice == "3") {
      //يعرض له جميع الكتب 
      library.displayAllBooks();
    } else if (choice == '4') {
      //تظهر له جميع المشتريات 
      displayReceipts();
    } else if (choice == "5") {
      break;
    } else {
      //ادخل الادمن رقم غلط 
      print(yalowPen("Invalid choice. Please try again."));
      print(blackPen(
          "......................................................................."));
    }
  }
}


  
