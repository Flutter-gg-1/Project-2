import '../json/data.dart';
import '../global.dart';
import '../model/book.dart';

void intitLibrary() {
  for (var element in data['library']!) {
    library.add(Book.fromJson(element));
  }
}

void showBooks() {
  for (Book book in library) {
    book.toPrint();
  }
}

void addBook(Book book) {
  book.id = (int.parse(library.last.id) + 1).toString();
  library.add(book);
}

void removeBook(String id) {
  outerLoop:
  for (var book in library) {
    if (id == book.id) {
      library.remove(book);
      print("delete was success");
      break outerLoop;
    }
  }
}

void addToCart(String id) {
  for (Book book in library) {
    if (id == book.id) {
      if (book.quantity > 0) {
        cart.add(book);
        book.quantity--;
      } else {
        print("OUT OF STOCK");
      }
    }
  }
}

void buy() {
  print(cart.length);
  if (cart.isNotEmpty) {
    double total = 0;
    for (Book book in cart) {
      total += book.price;
    }
    receiptHistory.add({"total": total, "books": List.from(cart)});
    cart.clear();
  } else {
    print("cart is empty");
  }
}

void emptyCart() {
  cart.clear();
}

void showReciptHistory() {
  for (var element in receiptHistory) {
    print("Total:${element["total"]}");
    print("Details");
    for (Book book in element["books"]) {
      book.toPrint();
    }
  }
}
