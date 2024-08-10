import 'dart:io';
import 'add_book.dart';
import 'print_with_color.dart';
import 'library.dart';
import 'library_data.dart';
import 'remove_book.dart';
import 'view_receipt_admin.dart';
import 'role_based.dart';
import 'exit_system.dart';

admin() {
  bool isExit = false;
  do {
    printWithColor(
        text: "\n          What would you like to do?\n", color: "Magenta");
    printWithColor(text: "(1) List all books", color: "Cyan");
    printWithColor(text: "(2) Add books", color: "Cyan");
    printWithColor(text: "(3) Remove books", color: "Cyan");
    printWithColor(text: "(4) View receipt", color: "Cyan");
    printWithColor(text: "(5) return back", color: "Cyan");
    printWithColor(text: "(6) Exit system", color: "Cyan");
    printWithColor(
        text: "\n~~~~~~~~~~Please select a number~~~~~~~~~~~~~~\n",
        color: "Magenta");

    int? input;
    try {
      input = int.parse(stdin.readLineSync()!);
    } catch (error) {
      printWithColor(text: "A number must be entered.", color: "Red");
      print(error);
      printWithColor(
          text: "\nTo return back to the main features press (Enter)\n",
          color: "Black");
      stdin.readLineSync();
      admin();
    }

    switch (input) {
      case 1:
        Library b1 = Library.fromJson(libraryData);
        print(b1.books.first.authors);
        printWithColor(
            text: "\nTo return back to the main features press (Enter)\n",
            color: "Black");
        stdin.readLineSync();
        break;
      case 2:
        addBook();
        break;
      case 3:
        removeBook();
        break;
      case 4:
        viewReceiptAdmin();
        break;
      case 5:
        rolebased();
        break;
        case 6:
        isExit = exitSystem();
        break;
      default:
        printWithColor(
            text: "\nPlease press (Enter) and select one of number from list",
            color: "Red");
        stdin.readLineSync();
        admin();
    }
  } while (!isExit);
}
