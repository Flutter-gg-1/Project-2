import 'dart:math';

import 'book.dart';

class Receipt {
  final int receiptId;
  final String bookId;
  final String title;
  final List<String> authors;
  final List<String> categories;
  final int year;
  final double price;

  Receipt({
    required this.bookId,
    required this.title,
    required this.authors,
    required this.categories,
    required this.year,
    required this.price,
  }) : receiptId = _generateReceiptId();

  static int _generateReceiptId() {
    Random random = Random();
    int id = 0;
    for (int i = 0; i < 10; i++) {
      id = id * 10 + random.nextInt(10);
    }

    return id;
  }

  void displayReceipt() {
    print('----------------------------------------');
    print('Receipt ID: $receiptId');
    print('Title: $title');
    print('Authors: ${authors.join(", ")}');
    print('Categories: ${categories.join(", ")}');
    print('Year: $year');
    print('Price: \$${price.toStringAsFixed(2)}');
    print('----------------------------------------');
  }
}
