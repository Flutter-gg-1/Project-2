import 'book_order.dart';

class Receipt {
  int id = 0;
  List<BookOrder> cart;
  double total = 0;
  static int _idCounter = 0; // Counter for generating unique IDs

  Receipt({required this.cart}) : id = ++_idCounter { // Assign a unique ID to each receipt
    for (var item in cart) {
      total += (item.book.price*item.quantity);
    }
  }

  printReceipt() {
    print("\n\n\n########## Receipt $id ##########");
    for (var item in cart) {
      print("--------------------");
      print("---book id: ${item.book.id}");
      print("---book title: ${item.book.title}");
      print("---book quantity: ${item.quantity}");
      print("---book price: ${item.book.price}");
    }
    print("--------------------");
    print("|   Total: $total  |");
    print("--------------------");
    print("###############################");
  }

}
