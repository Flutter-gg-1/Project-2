import 'dart:io';

import '../library_manager/admin.dart';
import '../library_manager/customer.dart';
import '../model/book.dart';
import '../model/book_categories.dart';
import '../model/user.dart';
import '../utils/colorful_print.dart';
import 'home.dart';
import 'home_print_msg.dart';
import 'home_verifiction_funcs.dart';

extension HomeFunctions on Home {
  // Auth
  void signIn() {
    do {
      signInInstructions();
      var userInput = stdin.readLineSync();
      try {
        var inputNum = int.parse(userInput ?? '');
        currentUser = User.userList.where((e) => e.id == inputNum).firstOrNull;
      } catch (_) {
        print('No ID number found for $userInput');
      }
    } while (currentUser == null);
  }

  void signOUt() => currentUser = null;

  // Admin
  void addBook() {
    String? idInput,
        titleInput,
        authorsInput,
        categoriesInput,
        yearInput,
        quantityInput,
        priceInput;

    ColorfulPrint.yellow('''
Adding a new Book
Enter cancel at anytime to exit this screen
''');

    // Outer Loop To Cancel Adding
    /// Inner Loops to Enter Fields
    outerloop:
    while (true) {
      do {
        print('example Input for ID: 1');
        ColorfulStdout.magenta('Enter an ID number:');
        idInput = stdin.readLineSync();
        if (idInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyID(idInput ?? ''));

      do {
        print('example Input for Title: Hello World!');
        ColorfulStdout.magenta('Enter a Title:');
        titleInput = stdin.readLineSync();
        if (titleInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyTitle(titleInput ?? ''));

      do {
        print('example Input for Authors: Superman, Spiderman, Batman');
        ColorfulStdout.magenta('Enter comma separated Author names:');
        authorsInput = stdin.readLineSync();
        if (authorsInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyAuthors(authorsInput ?? ''));

      do {
        BookCategory.showAll();
        print('example Input for Categories: 1, 3, 5');
        ColorfulStdout.magenta('Enter comma separated Category number:');
        categoriesInput = stdin.readLineSync();
        if (categoriesInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyCategories(categoriesInput ?? ''));

      do {
        print('example Input for Year: 2020');
        ColorfulStdout.magenta('Enter Year:');
        yearInput = stdin.readLineSync();
        if (yearInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyYear(yearInput ?? ''));

      do {
        print('example Input for Quantity: 15');
        ColorfulStdout.magenta('Enter Quantity:');
        quantityInput = stdin.readLineSync();
        if (quantityInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyQuantity(quantityInput ?? ''));

      do {
        print('example Input for Price: 10.99');
        ColorfulStdout.magenta('Enter Price:');
        priceInput = stdin.readLineSync();
        if (priceInput == 'cancel') {
          break outerloop;
        }
      } while (!verifyPrice(priceInput ?? ''));

      Book newBook = Book(
          id: idInput,
          title: titleInput,
          authors: authorsInput?.split(','),
          categories: categoriesInput!
              .replaceAll(' ', '')
              .split(',')
              .map((e) => BookCatExtension.getName(e))
              .toList(),
          year: int.tryParse(yearInput!),
          quantity: int.tryParse(quantityInput!),
          price: double.tryParse(priceInput!));

      library.books.add(newBook);

      ColorfulPrint.green('Book Added Successfully!');
      ColorfulPrint.yellow('Add another Book?');
      ColorfulStdout.yellow('Y for Yes, or any key to Exit');
      var response = stdin.readLineSync();
      if (response?.toLowerCase() != 'y') {
        break outerloop;
      }
    }
  }

  void removeBook() {
    String? userInput;

    ColorfulPrint.yellow('''
Removing a Book
Enter cancel at anytime to exit this screen
''');

    library.showAllBooks();

    outerloop:
    while (true) {
      ColorfulStdout.magenta('Enter a book ID to remove it from the Library');
      userInput = stdin.readLineSync();

      if (userInput == 'cancel') {
        break outerloop;
      } else {
        var book =
            library.books.where((book) => book.id! == userInput).firstOrNull;
        if (book == null) {
          ColorfulPrint.red('❌ No Book found with given ID $userInput');
        } else {
          library.removeBook(book);
          ColorfulPrint.green('✅ Book with title: ${book.title} Removed!');
          ColorfulPrint.yellow('Remove another Book?');
          ColorfulStdout.yellow('Y for Yes, or any key to Exit');
          var response = stdin.readLineSync();
          if (response?.toLowerCase() != 'y') {
            break outerloop;
          }
        }
      }
    }
  }

  void viewAllReciepts() => library.viewAllReciepts();

  // Customer
  void buyBook() {
    String? idInput;
    String? quantityInput;
    ColorfulPrint.yellow('Buy a Book');
    library.showAllBooks();

    outerloop:
    while (true) {
      ColorfulStdout.magenta('Enter a book ID to buy it');
      idInput = stdin.readLineSync();
      if (idInput == 'cancel') {
        break outerloop;
      } else {
        var book =
            library.books.where((book) => book.id! == idInput).firstOrNull;
        if (book == null) {
          ColorfulPrint.red('❌ No Book found with given ID $idInput');
        } else {
          ColorfulPrint.yellow(
              'How many number of copies do you want to purchase?');
          ColorfulStdout.magenta('Enter Quantity');
          quantityInput = stdin.readLineSync();
          if (quantityInput == 'cancel') {
            break outerloop;
          } else {
            if (verifyQuantity(quantityInput ?? '')) {
              var selectedQuantity = int.parse(quantityInput!);
              if ((book.quantity ?? 0) >= selectedQuantity) {
                if (selectedQuantity != 0) {
                  // Buy Book
                  library.buyBook(
                      customer: currentUser!,
                      bookId: idInput!,
                      quantity: selectedQuantity);

                  book.quantity = (book.quantity ?? 0) - selectedQuantity;
                  ColorfulPrint.green('✅ Purchase Successful!');
                } else {
                  ColorfulPrint.red(
                      '❌ Quantity must be a number larger than 0');
                }
              } else {
                ColorfulPrint.red('❌ Not Enough Books for desired Quantity!');
              }
            }
          }
        }
        ColorfulPrint.yellow('Buy another Book?');
        ColorfulStdout.yellow('Y for Yes, or any key to Exit');
        var response = stdin.readLineSync();
        if (response?.toLowerCase() != 'y') {
          break outerloop;
        }
      }
    }
  }

  void viewReciepts() => library.viewReciepts(customer: currentUser!);
}
