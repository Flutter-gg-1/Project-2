import 'library.dart';
import 'customer.dart';

class Purchase extends Book {
  String pid;
  DateTime createAt;
  double amount;
  Customer customer;

  Purchase(
      {required this.pid,
      required this.createAt,
      required this.customer,
      required this.amount,
      required super.id,
      required super.title,
      required super.authors,
      required super.categories,
      required super.year,
      required super.quantity,
      required super.price});
}
