import 'dart:io';
import 'package:project2/data.dart';
import 'package:project2/module/library.dart';
import 'package:project2/module/books.dart';
import 'package:project2/module/colors.dart';

void main() {
  const err = "Invalid Input. ";
  Library books = Library(
      library: myData["library"]!
          .map((element) => Books.fromJson(element))
          .toList()); // Looping through each map inside library and assigning the values into Books
  bool isLogged = false;
  bool userLoggin = true; // Checking logins for each while loop
  bool adminLoggin = true;
  do {
    userLoggin = true;
    adminLoggin = true;
    print(// Main Screen
        '$black---& $green Welcome to$reset $red Aziz\'s$reset $blue Library$reset $black&---📚 $reset');
    print('$brightBlue 1. Administrator Login $reset');
    print('$blue 2. Customer Login $reset');
    print('$blue Q. Exit $reset');
    String userInput = stdin.readLineSync()!;

    switch (userInput) {
      case "1": // Admin Interface
        while (adminLoggin) {
          print('$brightBlue 1. Add book $reset');
          print('$brightBlue 2. Remove book $reset');
          print('$brightBlue 3. View All books $reset');
          print('$brightBlue 4. View purchases history $reset');
          print('$brightBlue Q. Exit $reset');
          String userInput = stdin.readLineSync()!;
          switch (userInput) {
            case "1": // Add a book
              stdout.write("Title: ");
              String inputTitle = stdin.readLineSync()!;
              stdout.write(
                  "Authors (seperate with coma): "); // to create another value in a list, u need to seperate it with coma
              String inputAuthors = stdin.readLineSync()!;
              List<String> authorsList = inputAuthors.split(',');

              stdout.write("Categories (seperate with coma): ");
              String inputCategories = stdin.readLineSync()!;
              List<String> categoriesList = inputCategories.split(',');
              
              stdout.write("Year: ");
              int? inputYear = int.tryParse(stdin.readLineSync()!);
              if (inputYear == null) { // if null, continue will exit this operation
                print(err);
                continue;
              }
              stdout.write("Quantity: ");
              int? inputQuantity = int.tryParse(stdin.readLineSync()!);
              if (inputQuantity == null) {
                print(err);
                continue;
              }
              stdout.write("Price: ");
              double? inputPrice = double.tryParse(stdin.readLineSync()!);
              if (inputPrice == null) {
                print(err);
                continue;
              }
              books.addBook(Books( // Adding the book
                  authors: authorsList,
                  categories: categoriesList,
                  id: nextId(), // for unique IDs
                  price: inputPrice,
                  quantity: inputQuantity,
                  year: inputYear,
                  title: inputTitle));
              break;
            case "2": // Remove book by ID
              stdout.write("Enter the ID : ");
              String userInput = stdin.readLineSync()!;
              books.removeBook(userInput);
              break;
            case "3": // Display All Books with full information
              books.displayAllBooks(books);
              break;
            case "4": // DIsplay all receipts with full information
              books.viewRecepit();
              break;
            case "q" || "Q": // logout admin interface
              adminLoggin = false;
              break;
            default:
              print(err);
          }
        }

      case "2": // Costumer Interface
        while (userLoggin) {
          print('$blue 1. Buy a book $reset');
          print('$blue 2. View all books available $reset');
          print('$blue 3. View receipts $reset');
          print('$blue q. Exit $reset');

          String userInput = stdin.readLineSync()!;
          switch (userInput) {
            case "1": // Buy a book by typing the title "capital sensitive"
              books.displayAvailableBooks(books);
              stdout.write("Enter the title (Capital sensitive) : ");
              String inputUser = stdin.readLineSync()!;
              try { 
                books.buyBook(inputUser);
              } catch (e) {
                print("Book not found."); // If book title isn't found
              }
              break;
            case "2": // View all available books
              books.displayAvailableBooks(books);
              break;
            case "3": // View all reciepts
              books.viewRecepit();
              break;
            case "Q" || "q": // Exit Costumer Interface
              userLoggin = false;
              break;
            default:
              print(err);
          }
        }

      case "Q" || "q": // Exit Main Interface
        isLogged = true;

      default:
        print(err);
    }
  } while (!isLogged);
}

String nextId() { // Generating unique IDs
Books.countId++;
  return Books.countId.toString();
}
