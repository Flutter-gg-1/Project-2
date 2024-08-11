import 'dart:io';                                     // library used to interact with user
import 'dart:math';                                   // library used to generate random id number
import 'package:library_system/models/customer.dart'; // customer class

// function to sign up "create an account and be a customer !!"
void signUp({required List<Customer> customers}) {
  // generate random unique id
  int id = Random().nextInt(99999);
  while(customers.map((customer)=>customer.customerId).toList().contains(id)) {
    id = Random().nextInt(99999);
  }

  // get customer name
  stdout.write("Enter your name : ");
  String? name = stdin.readLineSync();
  while (name == null || name.contains(RegExp(r'[0-9]'))) {
    print("ERROR : Invalid name ❌\n");
    stdout.write("Enter your name : ");
    name = stdin.readLineSync();
  }

  // get customer current balance
  stdout.write("Enter your balance : ");
  String? balance = stdin.readLineSync();
  while (balance == null || double.tryParse(balance) == null) {
    print("ERROR : Invalid balance ❌\n");
    stdout.write("Enter your balance : ");
    balance = stdin.readLineSync();
  }
  
  // customer creation
  Customer customer = Customer(customerId: id, name: name, balance: double.parse(balance));
  customers.add(customer);
  print("customer ${customer.name} with ID ${customer.customerId} is created ✅\n");
}
