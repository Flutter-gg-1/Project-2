import 'dart:io';
import '../model/my_library.dart';
import '../model/library.dart';
import '../global/global_variabels.dart';
import '../global/print_with_color.dart';
import '../global/press_enter.dart';

adminDashboard() {
  do {
    PrintWithColors.yellow('''

HOME -> ADMIN
---------------------------------------

  1 | Add Book
  2 | Remove Book
  3 | Display Books
  4 | Display all the purchases
  5 | Signout
  
  ''');

    try {
      int userInput = int.parse(stdin.readLineSync()!);

      switch (userInput) {
        case 1:
          showAddBook();
          pressEnter();
          break;
        case 2:
          removeBook();
          pressEnter();
          break;
        case 3:
          MyLibrary.displayBooks("ADMIN");
          pressEnter();
          break;
        case 4:
          MyLibrary.displayCustomerPurchase();
          pressEnter();
          break;
        case 5:
          isExitAdmin = true;
          break;
        default:
          PrintWithColors.red("Please choose a number [1-5]:");
          pressEnter();
      }
    } on FormatException {
      PrintWithColors.red("Please enter a number");
    } catch (e) {
      print(e);
    }
  } while (!isExitAdmin);
}

showAddBook() {
  PrintWithColors.yellow('''

HOME -> ADMIN -> ADD BOOK
---------------------------------------
''');
  print("Enter title of book :");
  String inputTitle = stdin.readLineSync()!;
  print("Enter a number of authers :");
  int inputNumAuthers = int.parse(stdin.readLineSync()!);
  print("please input the names");
  List<String> newListAuthors =
      List.filled(inputNumAuthers, "", growable: false);
  int i = 0;
  while (i < inputNumAuthers) {
    newListAuthors[i] = stdin.readLineSync()!;
    i++;
  }
  print("Enter a number of categories :");
  int inputNumCat = int.parse(stdin.readLineSync()!);
  print("please input the names");
  List<String> newListCat = List.filled(inputNumCat, "", growable: false);
  int j = 0;
  while (j < inputNumCat) {
    newListCat[j] = stdin.readLineSync()!;
    j++;
  }
  print("Enter year of book :");
  int inputYear = int.parse(stdin.readLineSync()!);

  print("Enter the quantity:");
  int inputQnt = int.parse(stdin.readLineSync()!);

  print("Enter the price :");
  double inputPrice = double.parse(stdin.readLineSync()!);
  addBook(
      inputTitle, newListAuthors, newListCat, inputYear, inputQnt, inputPrice);
}

addBook(String title, List<String> authors, List<String> categories, int year,
    int quantity, double price) {
  var book = Book(
      id: bookID.toString(),
      title: title,
      authors: authors,
      categories: categories,
      year: year,
      quantity: quantity,
      price: price);

  MyLibrary.addBook(book);
  PrintWithColors.green("Book $title added to the library :)");
}

removeBook() {
  PrintWithColors.yellow('''

HOME -> ADMIN -> REMOVE BOOK
---------------------------------------
''');
  print("Enter the ID of the Book :");

  int id = int.parse(stdin.readLineSync()!);
  MyLibrary.removeBook(id.toString());
}
