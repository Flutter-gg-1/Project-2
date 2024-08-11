import 'dart:io';
import 'users_data.dart';

void viewReceipts() {
  if (receipts.isEmpty) {
    print("No receipts found.");
  } else {
    print("\nReceipts:");
    for (Map<String, dynamic> receipt in receipts) {
      print("\nReceipt Details:");
      receipt.forEach((key, value) {
        print("$key: $value");
      });
    }
  }
  stdin.readLineSync();
}
