import 'dart:io';
import 'dart:math';
import 'package:library_system/models/customer.dart';

void signUp({required List<Customer> customers}) {
  int id = Random().nextInt(99999);
  while(customers.map((customer)=>customer.customerId).toList().contains(id)) {
    id = Random().nextInt(99999);
  }

  stdout.write("Enter your name : ");
  String? name = stdin.readLineSync();
  while (name == null || name.contains(RegExp(r'[0-9]'))) {
    print("ERROR : Invalid name ❌\n");
    stdout.write("Enter your name : ");
    name = stdin.readLineSync();
  }
  
  stdout.write("Enter your balance : ");
  String? balance = stdin.readLineSync();
  while (balance == null || double.tryParse(balance) == null) {
    print("ERROR : Invalid balance ❌\n");
    stdout.write("Enter your balance : ");
    balance = stdin.readLineSync();
  }
  
  Customer customer = Customer(customerId: id, name: name, balance: double.parse(balance));
  
  customers.add(customer);

  print("customer ${customer.name} with ID ${customer.customerId} is created ✅\n");
}
