import '../global_varbiels.dart';
import '../models/book_model.dart';
import 'receipt.dart';

buyBook(String title) {
  for (Book element in library.library) {
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
