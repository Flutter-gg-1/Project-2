import 'receipt.dart';
import 'Models/book.dart';
import 'dart:io';
import 'data_set.dart';

List<Receipt> receipts = [];

printAllReceipts() {
  for (var receipt in receipts) {
    receipt.printReceipt();
  }
}

printAdminUi() {
  bool exit = false;
  List<String> categories = [];
  List<String> authors = [];

  do {
    print("\n\n----------Choose by number----------");
    print(
        "1-print all books\n2-add book\n3-remove book\n4-get all receipts\n0-exit");
    print("------------------------------------");

    int? input;
    try {
      input = int.parse(stdin.readLineSync()!);
    } catch (ex) {
      print("\n------------------------------------");
      print("You should enter an integer value");
      print("------------------------------------");

      continue;
    }

    switch (input) {
      case 1:
        library.printAllBooks();
        break;
      case 2:
        int year;
        double price;
        int quantity;
        print("add a book the library ");
        print("\n\nenter book title:");
        String title = stdin.readLineSync()!;
        do {
          print("\n\nenter book author:");
          String author = stdin.readLineSync()!;
          authors.add(author);
          String input;
          do {
            print("\n------------------------------------");
            print("Do you want to add another author?\n1-Yes\n2-No");
            print("------------------------------------");

            input = stdin.readLineSync()!;

            if (input != "1" && input != "2") {
              print("\n------------------------------------");
              print("Invalid input. Please enter 1 for Yes or 2 for No.");
              print("------------------------------------");
            }
          } while (input != "1" && input != "2");

          if (input == "2") {
            break;
          }
        } while (true);

        do {
          print("\n\nenter book categories:");
          String category = stdin.readLineSync()!;
          categories.add(category);

          String input;
          do {
            print("\n------------------------------------");
            print("Do you want to add another category?\n1-Yes\n2-No");
            print("------------------------------------");

            input = stdin.readLineSync()!;

            if (input != "1" && input != "2") {
              print("\n------------------------------------");
              print("Invalid input. Please enter 1 for Yes or 2 for No.");
              print("------------------------------------");
            }
          } while (input != "1" && input != "2");

          if (input == "2") {
            break;
          }
        } while (true);

        do {
          print("\n\nenter book publish year:");
          try {
            year = int.parse(stdin.readLineSync()!);
            if (year > 2024 || year < 0) {
              print("\n------------------------------------");
              print(
                  "you should enter a positive integer and should be less than 2024");
              print("------------------------------------");
              continue;
            }
            break;
          } catch (ex) {
            print("\n------------------------------------");
            print("enter year as an integer");
            print("------------------------------------");
          }
        } while (true);

        do {
          print("\n\nenter book available quantity:");
          try {
            quantity = int.parse(stdin.readLineSync()!);
            break;
          } catch (ex) {
            print("\n------------------------------------");
            print("enter quantity as an integer");
            print("------------------------------------");
          }
        } while (true);

        do {
          print("\n\nenter book price:");
          try {
            price = double.parse(stdin.readLineSync()!);
            break;
          } catch (ex) {
            print("\n------------------------------------");
            print("enter price as double");
            print("------------------------------------");
          }
        } while (true);

        Book book = Book.withoutId(
            title: title,
            authors: authors,
            categories: categories,
            year: year,
            quantity: quantity,
            price: price);

        library.addBook(book);
        break;
      case 3:
        print("\n\nremove a book from the library ");
        print("enter book id");
        int? id;
        try {
          id = int.parse(stdin.readLineSync()!);
          library.deleteBook(id.toString());
          print("\n");
          print("-" * 20);
          print("removed succefully");
          print("-" * 20);
        } catch (ex) {
          print(
              "\n\n---<you have entered invalid integer or the book is not found>---");
        }
        break;
      case 4:
        if (receipts.isEmpty) {
          print("\n");
          print("-" * 20);

          print("there are no receipts");
          print("-" * 20);
        }
        for (var receipt in receipts) {
          receipt.printReceipt();
        }
        break;
      case 0:
        exit = true;
        break;
      default:
        print("\n\nchoose a number from the menu");
        break;
    }
  } while (!exit);
}
