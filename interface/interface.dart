import 'dart:io';

import '../database/library_handler.dart';
import '../model/book.dart';

void sartUp() {
  late String userInput;
  do {
    print("1- admin 2- customer  0-turn off the system");
    userInput = stdin.readLineSync()!;
    switch (userInput) {
      case == "1":
        admin();
        break;
      case == "2":
        cutomer();
        break;

      default:
        if (userInput != "0") {
          print("the input must be one of the option");
        }
    }
  } while (userInput != "0");
}

void admin() {
  late String userInput;
  do {
    print(
        "1- add book 2- remove book 3- show all recipt\n4- show all book 0-exit");
    userInput = stdin.readLineSync()!;
    switch (userInput) {
      case == "1":
        add();
        break;
      case == "2":
        delete();
        break;
      case == "3":
        showReciptHistory();

        break;
      case == "4":
        showBooks();
      default:
        if (userInput != "0") {
          print("the input must be one of the option");
        }
    }
  } while (userInput != "0");
}

void delete() {
  showBooks();
  print("input book id to delete");
  String id = stdin.readLineSync()!;
  removeBook(id);
}

void add() {
  print("NOTE if the input is empty it give defult value");
  print("is required");
  late String title;
  do {
    print("title*");
    title = stdin.readLineSync()!;
    if (title.trim() == "" || title.trim() == " ") {
      print("please give the book a title");
    }
  } while (title.trim().isEmpty);
  String? author;
  List<String> authors = [];
  do {
    print("auther*  (0 to stop )");
    author = stdin.readLineSync()!;

    if (author.trim() != "0" && author.trim().isNotEmpty) {
      authors.add(author.trim());
    }
    if (authors.isEmpty) {
      print("you must add auther");
    }
  } while (author != "0" || authors.isEmpty);

  late String categorie;
  List<String> categories = [];
  do {
    print("category* (0 to stop)");
    categorie = stdin.readLineSync()!;

    if (categorie != "0" && categorie.trim().isNotEmpty) {
      categories.add(categorie.trim());
    }
  } while (categorie.trim() != "0" || categories.isEmpty);

  print("year 'integer number only'");
  late int year = 1998;
  try {
    year = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print(e);
    print("there an error while input year\nmake sure use only integer number");
  }

  print("quantity 'integer number only'");
  late int quantity = 0;
  try {
    quantity = int.parse(stdin.readLineSync()!);
  } catch (e) {
    print(e);
    print(
        "there an error while input quantity\nmake sure use only integer number");
  }

  print("price 'number only'");
  late double price = 0;
  try {
    price = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print(e);
    print("there an error while input price\n make sure use only number");
  }

  addBook(Book(
      id: "0",
      title: title.trim(),
      authors: authors,
      categories: categories,
      year: year,
      quantity: quantity,
      price: price));
}

void cutomer() {
  late String userInput;
  do {
    print("1- add book to cart  2- buy 0-exit");
    userInput = stdin.readLineSync()!;
    switch (userInput) {
      case == "1":
        showBooks();

        print("input id of the book");
        String id = stdin.readLineSync()!;
        addToCart(id);
        break;
      case == "2":
        buy();
        break;
      default:
        if (userInput != "0") {
          print("the input must be one of the option");
        }
    }
  } while (userInput != "0");
  emptyCart();
}
