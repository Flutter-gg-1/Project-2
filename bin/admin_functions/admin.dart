import 'dart:io';
import 'delete_book.dart';
import '../global_varbiels.dart';
import 'add_book.dart';

admin() {
  bool isExit = false;

  do {
    print("--------------- Hello Admin ----------------");
    print("Choose what you want to do:");
    print("1. Add book");
    print("2. Delete book");
    print("3. View the receipt for users purchases");
    print("4. Display all books");
    print("q. Exit");
    String input = stdin.readLineSync()!;

    switch (input) {
      case "1":
        addBook();
        break;
      case "2":
        print("enter id you want to delete");
        String bookId = stdin.readLineSync()!;
        deleteBook(bookId);

        break;
      case "3":
        print(receipt);
        break;

      case "4":
        library.listAllLibrary();
        break;

      case "q" || "Q":
        {
          isExit = true;
        }

        break;
      default:
    }
  } while (!isExit);
}
