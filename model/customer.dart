import 'user.dart';
import 'book.dart';

class Customer extends User {
  List<Book> purchaseHistory = [];

  Customer(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required this.purchaseHistory});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        purchaseHistory: json['purchaseHistory']);
  }
}
