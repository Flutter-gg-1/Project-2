import 'dart:io';

import 'package:library_system/models/get_id.dart';
import 'package:library_system/models/menu.dart';
import 'package:library_system/models/customer.dart';

void signIn({required List<Customer> customers}) {
  print("Enter 0 to go BACK");
  stdout.write("\nEnter customer ID : ");
  int id = getId(id:stdin.readLineSync(), customers:customers);
  if(id==0) {
    return;
  }
  Customer customer = customers.firstWhere((customer) => customer.customerId == id);
  menu(mode: 'customer', customer:customer);
  stdout.write("Choose an option : ");
  switch(stdin.readLineSync()) {
    case '1' :
    case '2' :
    case '3' :
    case '4' :
    case '0' :
      print("ERROR : Invalid Input ❌\n");
  }
}