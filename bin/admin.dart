import 'dart:io';
import 'global_varbiels.dart';
import 'new_book.dart';

admin() {
  bool isExit = false;

  do {
    print("--------------- Hello Admin ----------------");
    print("Choose what you want to do:");
    print("1. Add book");
    print("2. Delete book");
    print("3. View the receipt for users purchases");
    print("q. Exit");
    String input = stdin.readLineSync()!;

    switch (input) {
      case "1":
        library.addBook(newBook());

        break;
      case "2":
        print("enter id you want to delete");
        String bookId = stdin.readLineSync()!;
        library.removeBook(bookId);

        break;
      case "3":
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
