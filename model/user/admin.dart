import 'user.dart';
import 'customer.dart';

class Admin extends User {
  static List<Customer> customerList = [];
  Admin(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.password});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'password': password
    };
  }

  static displayAllCustomers() {
    print('\n--- Customers of Library ---\n');
    for (var customer in customerList) {
      print('Customer ID: ${customer.id}');
      print('Customer Name: ${customer.firstName} ${customer.lastName}');
      print('Books Bought:');
      if(customer.purchaseHistory.isEmpty){
        print('No Books purchased');
      }
      for (var book in customer.purchaseHistory) {
        print(book.toJson());
      }
      print('');
    }
  }
}
