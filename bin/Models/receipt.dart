import 'admin.dart';
import 'book_order.dart';

class Receipt {
  static int id = 0;
  List<BookOrder> cart;
  double total = 0;

  Receipt({required this.cart}) {
    id = id + 1;
    for (var item in cart) {
      total += item.book.price;
    }
    receipts.add(this);
  }

  printReceipt() {
    print("\n\n\n########## Receipt $id ##########");
    for (var item in cart) {
      print("--------------------");
      print("---book id: ${item.book.id}");
      print("---book title: ${item.book.title}");
      print("---book quantity: ${item.book.quantity}");
      print("---book price: ${item.book.price}");
    }
    print("--------------------");
    print("|   Total: $total  |");
    print("--------------------");

    print("###############################");
  }
}
