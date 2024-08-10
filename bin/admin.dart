import 'exit_method.dart';
import 'dart:io';
import 'opreations/add_book.dart';
import 'opreations/remove_book.dart';
import 'opreations/customer_receipt.dart';
import 'opreations/all_receipts.dart';
import 'receipt_list.dart';
import 'library_list.dart';

admin() {
  //variable
  bool isExit = false;
  //loop of admin opreation
  do {
    print("\n_______________Welcome to Admin System_______________\n");
    print("* Select what type of opreation do you want to perform:");
    print("0: Add Book");
    print("1: Remove Book");
    print("2: View all receipt of purchases");
    print("3: View receipt of purchases by customer ID");
    print("Q: Exit");

    print("Enter your choice:");
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
            print("Enter Book ID :");
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
            print("Enter Book title :");
            String? bookTitle = stdin.readLineSync();
            if (bookTitle == null || bookTitle.isEmpty) {
              throw FormatException("X Book title cannot be empty X");
            }
            //add and cheack book authors
            print("Enter Book authors :");
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
            print("Enter Book categories :");
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
            print("Enter Book year :");
            int bookYear = int.parse(stdin.readLineSync()!);
            if (bookYear <= 1500 && bookYear >= 2024) {
              throw FormatException(
                  "X Book year must be between 1500 and 2024 X");
            }
            //add and cheack book quantity
            print("Enter Book quantity :");
            int bookQuantity = int.parse(stdin.readLineSync()!);
            if (bookQuantity <= 0) {
              throw FormatException("X Book quantity must be at least one X");
            }

            //add and cheack book price
            print("Enter Book price (more than 20):");
            double bookPrice = double.parse(stdin.readLineSync()!);
            if (bookPrice <= 20 && bookPrice >= 2000) {
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
            print("X Error: $e X");
          }
          break;

        //Remove Book
        case "1":
          print("Enter Book ID :");
          String bookId = stdin.readLineSync()!;
          removebook(bookId: bookId);

          break;

        //View all receipt of purchases
        case "2":
          allReceipts(receiptes: receiptList);
          break;

        //View receipt of purchases by customer ID
        case "3":
          print("Enter Customer ID :");
          int customerId = int.parse(stdin.readLineSync()!);
          customerReceipt(customerId: customerId);
          break;

        //for exit
        case "Q" || "q":
          isExit = exitMethod();
          break;

        default:
          print("X Invalid choice please select choice from the list X");
      }
    } catch (e) {
      print("X Error: $e X");
    }

    //end loop
  } while (!isExit);
  print("See you later (:");
}
