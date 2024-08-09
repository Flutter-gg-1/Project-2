import 'dart:io';
import '../model/my_library.dart';
import '../model/library.dart';
import '../global_variabels.dart';

adminDashboard() {
  do {
    print('''
  |||||||||||||| ADMIN ||||||||||||   

  1 | Add Book
  2 | Remove Book
  3 | Display all the purchases
  4 | Signout
  
  ''');

    try {
      int userInput = int.parse(stdin.readLineSync()!);

      switch (userInput) {
        case 1:
          showAddBook();
          print(myBook.last.authors);
          break;
        case 2:
          print("Enter the ID of the Book :");
          String id = stdin.readLineSync()!;
          MyLibrary.removeBook(id);
          print(myBook);
          break;
        case 4:
          isExitAdmin = true;
          break;
        default:
          isExitAdmin = true;
          isExitMainPage = true;
      }
    } on FormatException {
      print("Please enter a number");
    } catch (e) {
      print(e);
    }
  } while (!isExitAdmin);
}

showAddBook() {
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
}
