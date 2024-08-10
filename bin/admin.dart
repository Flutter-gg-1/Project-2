import 'exit_method.dart';
import 'dart:io';
import 'opreations/add_book.dart';
import 'opreations/remove_book.dart';
import 'opreations/customer_receipt.dart';
import 'opreations/all_receipts.dart';
import 'receipt_list.dart';
import 'library_list.dart';
import 'color_print.dart/print_with_colors.dart';

admin() {
  //variable
  bool isExit = false;
  //loop of admin opreation
  do {
    printWithColor(
        text: "\n_______________Welcome to Admin System_______________\n",
        color: "Magenta");
    printWithColor(
        text: "* Select what type of opreation do you want to perform:",
        color: "Blue");
    printWithColor(text: "0: Add Book", color: "Blue");
    printWithColor(text: "1: Remove Book", color: "Blue");
    printWithColor(text: "2: Display all receipt of purchases", color: "Blue");
    printWithColor(
        text: "3: Display receipt of purchases by customer ID", color: "Blue");
    printWithColor(text: "Q: Exit", color: "Blue");

    printWithColor(text: "Enter your choice:", color: "Blue");
    String? userInput = stdin.readLineSync();
    //error handling
    try {
      if (userInput!.isEmpty) {
        throw FormatException("X Empty input X");
      }

      switch (userInput) {
        //Add Book
        case "0":
          try {
            //add and cheack book id
            printWithColor(text: "Enter Book ID :", color: "Blue");
            String? bookId = stdin.readLineSync();
            if (bookId == null || bookId.isEmpty) {
              throw FormatException("X Book ID cannot be empty X");
            }
            bool idExists =
                libraryList.any((element) => element["id"] == bookId);
            if (idExists) {
              throw FormatException("X Book ID already exists X");
            }

            //add and cheack book title
            printWithColor(text: "Enter Book title:", color: "Blue");
            String? bookTitle = stdin.readLineSync();
            if (bookTitle == null || bookTitle.isEmpty) {
              throw FormatException("X Book title cannot be empty X");
            }
            //add and cheack book authors
            printWithColor(text: "Enter Book authors :", color: "Blue");
            String? authorsInput = stdin.readLineSync();
            List<String> bookAuthors = authorsInput != null
                ? authorsInput
                    .split(',')
                    .map((a) => a.trim())
                    .where((a) => a.isNotEmpty)
                    .toList()
                : [];
            if (bookAuthors.isEmpty) {
              throw FormatException("X At least one author must be entered X");
            }

            //add and cheack book categories
            printWithColor(text: "Enter Book categories :", color: "Blue");
            String? categoriesInput = stdin.readLineSync();
            List<String> bookCategories = categoriesInput != null
                ? categoriesInput
                    .split(',')
                    .map((c) => c.trim())
                    .where((c) => c.isNotEmpty)
                    .toList()
                : [];
            if (bookCategories.isEmpty) {
              throw FormatException(
                  "X At least one category must be entered X");
            }
            //add and cheack book year
            printWithColor(text: "Enter Book year :", color: "Blue");
            int bookYear = int.parse(stdin.readLineSync()!);
            if (bookYear <= 1500 || bookYear >= 2024) {
              throw FormatException(
                  "X Book year must be between 1500 and 2024 X");
            }
            //add and cheack book quantity
            printWithColor(text: "Enter Book quantity :", color: "Blue");
            int bookQuantity = int.parse(stdin.readLineSync()!);
            if (bookQuantity <= 0) {
              throw FormatException("X Book quantity must be at least one X");
            }

            //add and cheack book price
            printWithColor(
                text: "Enter Book price (more than 20):", color: "Blue");
            double bookPrice = double.parse(stdin.readLineSync()!);
            if (bookPrice <= 20 || bookPrice >= 2000) {
              throw FormatException(
                  "X Book price must be between 20 and 2000 X");
            }

            addBook(
                bookId: bookId,
                bookTitle: bookTitle,
                bookAuthors: bookAuthors,
                bookCategories: bookCategories,
                bookYear: bookYear,
                bookQuantity: bookQuantity,
                bookPrice: bookPrice);
          } catch (e) {
            printWithColor(text: "X Error: $e X", color: "Red");
          }
          break;

        //Remove Book
        case "1":
          printWithColor(text: "Enter Book ID :", color: "Blue");
          String bookId = stdin.readLineSync()!;
          removebook(bookId: bookId);

          break;

        //View all receipt of purchases
        case "2":
          allReceipts(receiptes: receiptList);
          break;

        //View receipt of purchases by customer ID
        case "3":
          printWithColor(text: "Enter Customer ID :", color: "Blue");
          int customerId = int.parse(stdin.readLineSync()!);
          customerReceipt(customerId: customerId);
          break;

        //for exit
        case "Q" || "q":
          isExit = exitMethod();
          break;

        default:
          printWithColor(
              text: "X Invalid choice please select choice from the list X",
              color: "Red");
      }
    } catch (e) {
      printWithColor(text: "X Error: $e X", color: "Red");
    }

    //end loop
  } while (!isExit);
  printWithColor(text: "See you later (:", color: "Magenta");
}
