import 'receipt.dart';
import 'book.dart';
import 'library.dart';

List<Receipt> receipts = [];

printAllReceipts() {
  for (var receipt in receipts) {
    receipt.printReceipt();
  }
}

