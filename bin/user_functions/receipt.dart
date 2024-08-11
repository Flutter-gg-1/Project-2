import '../global_varbiels.dart';
import '../models/book_model.dart';

//function to add a receipt
receiptadd(Book book) {
  DateTime date = DateTime.now();
  Map bookReceipt = {"date": date, "bookTitle": book.title, "bookId": book.id};

  receipt.add(bookReceipt);
}

//function to display receipts
displayReceipts() {
  for (Map element in receipt) {
    print("-------------------------------");
    print("--receipt for the purchased book--");
    print("Date of purchase: ${element["date"]}");
    print("Book title: ${element["bookTitle"]}");
    print("Book ID: ${element["bookId"]}");
    print("-------------------------------");
  }
}
