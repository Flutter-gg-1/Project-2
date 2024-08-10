import 'package:library_system/models/book.dart';

class Receipt {
  final int receiptId;
  final Book book;
  final String date;

  Receipt({required this.book, required this.date, required this.receiptId});
}