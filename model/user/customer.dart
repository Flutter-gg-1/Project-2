import 'user.dart';
import '../book.dart';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../utils/updateuser.dart';
import 'admin.dart';
import '../../bin/library_system.dart';

class Customer extends User {
  List<Book> purchaseHistory = [];
  static int sequence = 0;

  Customer(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.password,
      required this.purchaseHistory}) {
    sequence++;
    for (var customer in Admin.customerList) {
      if (customer.id == id) {
        return;
      }
    }
    Admin.customerList.add(this);
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      purchaseHistory: (json['books_bought'] as List)
          .map((book) => Book.fromJson(book))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'books_bought':
          purchaseHistory.map((purchase) => purchase.toJson()).toList()
    };
  }

  static addNewCustomer() {
    print(color('Fill in the following information\n'));
    String id = '$sequence';

    stdout.write(cyan('First Name: '));
    String firstName = '';
    try {
      firstName = checkName(stdin.readLineSync()!);
    } catch (e) {
      rethrow;
    }

    stdout.write(cyan('Last Name: '));
    String lastName = '';
    try {
      lastName = checkName(stdin.readLineSync()!);
    } catch (e) {
      rethrow;
    }
    String password = setPassword();

    Customer customer = Customer(
        id: id,
        firstName: firstName,
        lastName: lastName,
        password: password,
        purchaseHistory: []);
    print(green('Registration Successful!!'));
    print(gold('Your ID is ${customer.id}'));
    updateUser(customer);
  }

  static String setPassword() {
    stdout.write(cyan('Enter password: '));
    String password = stdin.readLineSync()!;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    return hashedPassword;
  }

  displayPurchasedBooks() {
    for (var customer in Admin.customerList) {
      if (customer.id == id) {
        print(blue('Books Bought:'));
        if (customer.purchaseHistory.isEmpty) {
          print(('No Books purchased'));
        }
        for (var book in customer.purchaseHistory) {
          print(gold(book.toJson()));
        }
      }
    }
  }

  static String checkName(String name) {
    if (name.split('').any((char) => '0123456789'.contains(char))) {
      throw Exception('First and Last Name cannot have numbers!!');
    }
    return name;
  }
}
