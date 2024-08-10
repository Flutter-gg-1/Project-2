import 'dart:io';
import '../model/my_library.dart';
import '../model/library.dart';
import '../global/global_variabels.dart';
import '../global/print_with_color.dart';
import '../global/press_enter.dart';
import '../global/check_input.dart';

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
  bool isExitTitle = false;
  bool isExitNumAuthers = false;
  bool isExitAuthoers = false;
  bool isExitNumCat = false;
  bool isExitCat = false;
  bool isExitYear = false;
  bool isExitQnt;
  bool isExitPrice;
  String? inputTitle;
  String? inputNumAuthers;
  List<String>? newListAuthors;
  String? inputNumCat;
  List<String>? newListCat;
  String? inputYear;
  String? inputQnt;
  String inputPrice;
  PrintWithColors.yellow('''

HOME -> ADMIN -> ADD BOOK
---------------------------------------
''');

  do {
    print("Enter title of book :");
    inputTitle = stdin.readLineSync()!;
    isExitTitle = checkInput(inputTitle, "Sorry!Please fill the title");
  } while (!isExitTitle);

  do {
    print("Enter a number of authers :");
    inputNumAuthers = stdin.readLineSync()!;
    if (int.tryParse(inputNumAuthers) != null) {
      isExitNumAuthers = true;
    } else {
      isExitNumAuthers = false;
      PrintWithColors.red("Sorry! You must add a number.");
    }
  } while (!isExitNumAuthers);

  do {
    newListAuthors =
        List.filled(int.parse(inputNumAuthers), "", growable: false);
    int i = 0;
    while (i < int.parse(inputNumAuthers)) {
      print("Enter a name of authers[${i + 1}] :");

      newListAuthors[i] = stdin.readLineSync()!;
      if (newListAuthors[i].isEmpty) {
        PrintWithColors.red("Sorry!Please fill the authoer name");
        isExitAuthoers = false;
      } else {
        isExitAuthoers = true;
        i++;
      }
    }
  } while (!isExitAuthoers);

  do {
    print("Enter a number of categories :");
    inputNumCat = stdin.readLineSync()!;
    if (int.tryParse(inputNumCat) != null) {
      isExitNumCat = true;
    } else {
      isExitNumCat = false;
      PrintWithColors.red("Sorry! You must add a number.");
    }
  } while (!isExitNumCat);

  do {
    newListCat = List.filled(int.parse(inputNumCat), "", growable: false);
    int j = 0;
    while (j < int.parse(inputNumCat)) {
      print("please input the names [${j + 1}]");

      newListCat[j] = stdin.readLineSync()!;
      if (newListCat[j].isEmpty) {
        PrintWithColors.red("Sorry!Please fill the authoer name");
        isExitCat = false;
      } else {
        isExitCat = true;
        j++;
      }
    }
  } while (!isExitCat);

  do {
    print("Enter year of book :");
    inputYear = stdin.readLineSync()!;

    if (int.tryParse(inputYear) != null &&
        int.tryParse(inputYear)! >= 200 &&
        int.tryParse(inputYear)! <= 2024) {
      isExitYear = true;
    } else {
      isExitYear = false;
      PrintWithColors.red(
          "Sorry! You must add a positive number between [200-2024].");
    }
  } while (!isExitYear);

  do {
    print("Enter the quantity:");
    inputQnt = stdin.readLineSync()!;

    if (int.tryParse(inputQnt) != null && int.tryParse(inputQnt)! > 0) {
      isExitQnt = true;
    } else {
      isExitQnt = false;
      PrintWithColors.red("Sorry! You must add a number greater than 0.");
    }
  } while (!isExitQnt);

  do {
    print("Enter the price :");
    inputPrice = stdin.readLineSync()!;

    if (double.tryParse(inputPrice) != null &&
        double.tryParse(inputPrice)! > 0) {
      isExitPrice = true;
    } else {
      isExitPrice = false;
      PrintWithColors.red("Sorry! You must add a number greater than 0.");
    }
  } while (!isExitPrice);

  addBook(inputTitle, newListAuthors, newListCat, int.parse(inputYear),
      int.parse(inputQnt), double.parse(inputPrice));
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
  bool isExitRemoveBook = false;
  String? id;
  PrintWithColors.yellow('''

HOME -> ADMIN -> REMOVE BOOK
---------------------------------------
''');

  do {
    print("Enter the ID of the Book :");
    id = stdin.readLineSync()!;
    if (int.tryParse(id) != null && int.tryParse(id)! > 0) {
      MyLibrary.removeBook(id.toString());
      isExitRemoveBook = true;
    } else {
      isExitRemoveBook = false;
      PrintWithColors.red("Sorry!Please add a number greater than 0");
    }
  } while (!isExitRemoveBook);
}
