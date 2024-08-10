import 'dart:io';
import 'custmer.dart';
import '../muodiles/bookStore.dart';
import '../muodiles/library.dart';

class Admin extends Custmer {
  Admin({
    //admin extand from the custmer the username and id attbute
    required super.userName,
    required super.password,
  });

  viewAllBokks(List<BookStore> books) {
    for (var element in books) {
      //this mithod will view all the valuies indidem the json
      print(element.toJson());
    }
  }

  void addBook(BookStore books) {
    //this function will add book to the varible of book
    print("Please enter the book ID:"); //here we will take the id
    String id = stdin.readLineSync()!;

    print("Please enter the title:"); //here we will take the title
    String title = stdin.readLineSync()!;

    print(
        "Please enter the authors names :"); //here we will take the title authors names
    List<String> authors = stdin.readLineSync()!.split(',');

    print("Please enter the categories :"); //here we will take categories
    List<String> categories = stdin.readLineSync()!.split(',');

    print(
        "Please enter the year of publication:"); //here we will take publication
    int year = int.parse(stdin.readLineSync()!);

    print("Please enter the quantity:");
    int quantity =
        int.parse(stdin.readLineSync()!); //here we will take quantity

    print("Please enter the price:");
    double price =
        double.parse(stdin.readLineSync()!); //here we will take price

    // Creating a new book object
    Library newBook = Library(
      id: id,
      title: title,
      authors: authors,
      categories: categories,
      year: year,
      quantity: quantity,
      price: price,
    );

    // adding the new book to the list
    books.library.add(newBook);
  }

  void removeBook(BookStore books) {
    print("Enter the id: ");
    String id = stdin.readLineSync()!;
    if (books.library.first.id == id) {
      books.library.removeWhere((books) => books.id == id); //remove by id

      print("Book removed successfully!");
    } else {
      print("book not fund");
    }
  }

  void viewReceiptAdmin(List recAdmin) {
    //this list will take the value for recept in main
    print("Admin Viewing Receipts:");
    for (var receipt in recAdmin) {
      //here i used for loop to print the list vlaue
      print(receipt);
    }
  }
}
