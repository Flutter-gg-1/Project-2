import 'dart:io';
import 'Models/book.dart';
import 'data_set.dart';
import 'receipt.dart';
import 'admin.dart';

printCustomerUi() {
  bool exit = false;
  do {
    print("\n\n----------Choose by number----------");
    print("1-print all books");
    print("2-add book to cart");
    print("3-remove book from cart");
    print("4-view my cart");
    print("5-checkout and print receipt");
    print("0-exit");
    print("-----------------------------------");

    int? input;
    try {
      input = int.parse(stdin.readLineSync()!);
    } catch (ex) {
      print("\n\nyou should enter a number from the menu");
      continue;
    }

    switch (input) {
      case 1:
        library.printAllBooks();
        break;
      case 2:
        int? id;
        int? quantity;
        try {
          print("enter book id:");
          id = int.parse(stdin.readLineSync()!);
          print("enter quantity:");
          quantity = int.parse(stdin.readLineSync()!);
          var book = library.getBookById(id.toString());
          if (book is Book) {
            library.addToCart(book, quantity);
          }
        } catch (ex) {
          print("you should enter a number from the menu");
          continue;
        }
        break;
      case 3:
        print("\n\nremove a book from my cart");
        print("enter book id");
        int? id;
        try {
          id = int.parse(stdin.readLineSync()!);
          library.deleteBookFromCart(id.toString());
        } catch (ex) {
          print(
              "\n\n---<you have entered invalid integer or the book is not found>---");
        }
        break;
      case 4:
        double total = 0;
        print("\n\n########## your cart ##########");
        for (var item in library.cart) {
          total += (item.book.price * item.quantity);
          print("----------book info----------");
          print('---id: ${item.book.id}');
          print('---title: ${item.book.title}');
          print('---price: ${item.book.price}');
          print('---quantity: ${item.quantity}');
          print("-----------------------------");
        }
        print("--------------------");
        print("|   Total: $total  |");
        print("--------------------");
        print("###############################");
        break;
      case 5:
        if (library.cart == []) {
          print("\n");
          print("-" * 20);
          print("your cart is empty");
          print("-" * 20);
        }
        Receipt receipt = Receipt(cart: List.from(library.cart));
        receipt.printReceipt();
        receipts.add(receipt);
        library.cart = [];
        break;
      case 0:
        exit = true;
      default:
        print("\n\nchoose a number from the menu");
        break;
    }
  } while (!exit);
}
