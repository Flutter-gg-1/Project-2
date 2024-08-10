import 'book_model.dart';

class Library {
  final List<Book> library;

  Library({required this.library});

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
        library: List.from(json["library"]).map((element) {
      return Book.fromJson(element);
    }).toList());
  }

  Map<String, dynamic> toJson() {
    return {"library": library.map((e) => e.toJson()).toList()};
  }

  addBook(Book book) {
    library.add(book);
  }

  removeBook(String id) {
    Book? value;
    for (var element in library) {
      if (element.id == id) {
        value = element;
      }
    }
    library.remove(value);

    print("-----Book with $id id is successfully-----");
  }

  buyBook(String title) {
    for (Book element in library) {
      if (element.title == title) {
        if (element.quantity > 0) {
          element.quantity = element.quantity - 1;
          print("\n Book purchases done ^_^");
          receiptadd(element);
        } else {
          print("Book is not available!");
        }
      }
    }
  }

  listAllLibrary() {
    for (var element in library) {
      print("----------------------------------------");
      print(element.toJson());
    }
  }

  List<Map> receipt = [];
  receiptadd(Book book) {
    DateTime date = DateTime.now();
    Map bookReceipt = {
      "date": date,
      "bookTitle": book.title,
      "bookId": book.id
    };

    receipt.add(bookReceipt);
  }

  displayReceipts() {
    for (Map element in receipt) {
      print("-------------------------------");
      print("--receipt for the purchased book--");
      print("Date of purchase: ${element["date"]}");
      print("Book title: ${element["bookTitle"]}");
      print("Book ID ${element["bookId"]}");
      print("-------------------------------");
    }
  }
}
