import 'dart:io';

import 'package:project2/module/purchase_history.dart';

import 'books.dart';
import 'colors.dart';

class Library {
  final List<Books> library;

  Library({required this.library}); // Constructor
  void addBook(Books book) { // Add book 
    library.add(book);
  }

  void removeBook(String id) { // Remove book by ID
    library.removeWhere((book) => book.id == id);
  }

  void viewRecepit() { // View all Recepit 
    if (purchaseHistory.isEmpty) {
      print("$red No Purchases $reset");
    } else {
      for (var element in purchaseHistory) {
        print('\n\n$greenBG---& Receipt &---$reset');
        print("$cyan ID: ${element["id"]}$reset");
        print("$cyan Title: ${element["title"]}$reset");
        print("$cyan Price: ${element["price"]}$reset");
        print("$cyan Final price: ${element["final_price"]}$reset");
        print("$cyan Date purchased: ${element["date"]}$reset");
      }
    }
    stdin.readLineSync();
  }

  void buyBook(String title) { // Buy book function
    Map<String, dynamic> purchased = {};
    var date = DateTime.now();

    final book = library.firstWhere((book) => book.title == title);
    if (book.quantity > 0) {
      book.quantity--;
      print("$brightGreen Successfully purchased! $reset");
      purchased = {
        "id": book.id,
        "title": book.title,
        "price": book.price,
        "final_price": book.price,
        "date": date
      };

      purchaseHistory.add(purchased);
      stdin.readLineSync();
    } else {
      print("$brightRed ${book.title} Is out of stock! $reset");
      stdin.readLineSync();
    }
  }

  void displayAvailableBooks(Library libraryList) { // Display All Available Books
    print("Available Books:");
    for (var book in libraryList.library) {
      if (book.quantity > 0) {
        print(
            "{ $brightYellow${book.title}$reset - $brightGreen\$${book.price}$reset }");
      }
    }
  }

  void displayAllBooks(Library libraryList) { // Display All Books
    for (var book in libraryList.library) {
      print('$brightYellow Book Details:$reset');
      print('$brightGreen "ID:" $reset ${book.id}');
      print('$brightGreen "Title:" $reset ${book.title}');
      print('$brightGreen "Authors:" $reset ${book.authors.join()}');
      print('$brightGreen "Categories:" $reset ${book.categories.join(" ")}');
      print('$brightGreen "Year:" $reset ${book.year}');
      print(
          '$brightGreen "Quantity:" $reset ${book.quantity == 0 ? "$brightRed OUT OF STOCK" : book.quantity}');
      print('$brightGreen "Price:" $reset \$${book.price}');
      print('');
    }
    stdin.readLineSync();
  }

  factory Library.fromJson(Map<String, dynamic> json) { // Factory 
    List<Books> books = [];
    for (var element in json["library"]) {
      books.add(element);
    }
    return Library(library: books);
  }
  Map<String, dynamic> toJson() { // To Json if needed.
    List<Map<String, dynamic>> libraryList =
        library.map((element) => element.toJson()).toList();
    return {"library": libraryList};
  }
}
