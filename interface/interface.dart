import 'dart:io';

import '../database/library_handler.dart';
import '../model/book.dart';

void sartUp() {
  print("1-admin 2- cutomer");
}

void admin() {
  late String userInput;
  do {
    print(
        "1- add book 2- remove book 3- show all recipt 4- show all book 0-exit");
    userInput = stdin.readLineSync()!;
    switch (userInput) {
      case == "1":
        add();
        break;
      case == "2":
        delete();
        break;
      case == "3":
        showBooks();
        break;
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
  print("* is required");
  late String title;
  do {
    print("title*");
    title = stdin.readLineSync()!;
    if (title.trim() != "" || title.trim() != " ") {
      print("please give the book a title");
    }
  } while (title.trim() != "" || title.trim() != " ");
  String? author;
  List<String> authors = [];
  do {
    print("auther*  (0 to stop )");
    author = stdin.readLineSync()!;
    author == "" ? author = "0" : author = author;

    if (author.trim() != "0") {
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
    categorie == "" ? categorie = "0" : categorie = categorie;

    if (categorie != "0") {
      categories.add(categorie.trim());
    }
  } while (categorie.trim() != "0");

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
