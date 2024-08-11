import 'dart:io';
import '../user_functions/receipt.dart';
import 'delete_book.dart';
import '../global_varbiels.dart';
import 'add_book.dart';
import 'display_books.dart';

//function admin
admin() {
  bool isExit = false;

  do {
    //display list of functions to the admin to choose from
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
        print("Enter book id you want to delete");
        String bookId = stdin.readLineSync()!;
        deleteBook(bookId);

        break;
      case "3":
        displayReceipts();
        break;

      case "4":
        listAllLibrary();
        break;

      case "q" || "Q":
        {
          isExit = true;
        }

        break;
      default:
        print("not a viled input");
    }
  } while (!isExit);
}
