import 'book.dart';
import '../data_set.dart';
import '../book_order.dart';
import '../receipt.dart';

class Library {
  List<Book> books;
  List<BookOrder> cart = [];

  Library({required this.books});

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        books: List.from(json["library"]).map((element) {
      return Book.fromJson(element);
    }).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      "library": books.map((element) {
        return element.toJson();
      })
    };
  }

  addBook(Book book) {
    try {
      books.add(book);
      print("\n");
      print("-" * 20);
      print("Book added successfully");
      print("-" * 20);
    } catch (ex) {
      print("\nerror: $ex");
    }
  }

  deleteBook(String id) {
    for (var book in books) {
      if (book.id == id) {
        books.remove(book);
        return;
      }
    }
    print("\n\n-" * 20);
    print("book not found");
    print("-" * 20);
  }

  addToCart(Book book, int quantity) {
    if (book.quantity == 0) {
      print("\nthis book is not available now");
      return;
    } else if (book.quantity < quantity) {
      print(
          "\nsorry we don't have this quantity of this book, we only have ${book.quantity} books");
      return;
    }
    try {
      book.quantity -= quantity;
      BookOrder bookOrder = BookOrder(book: book, quantity: quantity);
      for (var item in cart) {
        if (item.book.id == bookOrder.book.id) {
          item.quantity += bookOrder.quantity;
          print("-" * 20);
          print("Book added successfully");
          print("-" * 20);
          return;
        }
      }
      cart.add(bookOrder);
      print("-" * 20);
      print("Book added successfully");
      print("-" * 20);
    } catch (ex) {
      print("\nerror: $ex");
    }
  }

  deleteBookFromCart(String id) {
    for (var item in cart) {
      if (item.book.id == id) {
        cart.remove(item);
        Book book = library.getBookById(id);
        book.quantity += item.quantity;
        return;
      }
    }
    print("\n\n-" * 20);
    print("book not found");
    print("-" * 20);
  }

  printInfo(Book book) {
    print("----------book info----------");
    print('---id: ${book.id}');
    print('---title: ${book.title}');
    print('---categories: ${book.categories}');
    print('---authors: ${book.authors}');
    print('---year: ${book.year}');
    print('---quantity: ${book.quantity}');
    print('---price: ${book.price}');
    print("-----------------------------");
  }

  printAllBooks() {
    for (var book in books) {
      printInfo(book);
    }
  }

  printMyRecipt() {
    Receipt receipt = Receipt(cart: cart);
    receipt.printReceipt();
  }

  getBookById(String id) {
    for (var book in books) {
      if (book.id == id) {
        return book;
      }
    }
    return "book is not found";
  }
}
