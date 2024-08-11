import 'dart:io';                                     // library used to interact with user
import 'package:library_system/dataset.dart';         // dataset
import 'package:library_system/models/customer.dart'; // customer class
import 'package:library_system/models/book.dart';     // book class
import 'package:library_system/models/menu.dart';     // menu function
import 'package:library_system/models/sign_in.dart';  // sign in function
import 'package:library_system/models/sign_up.dart';  // sign up function
import 'package:library_system/models/admin.dart';    // admin function

void main(List<String> arguments) {
  // initialize two important lists
  List<Customer> customers = [];
  List<Book> library = [];
  for(var book in dataset['library']) {
    library.add(Book.fromJson(book));
  }

  print('\nProject 2 : Library System');
  while_loop :
  while(true) {
    menu(mode: 'guest');
    stdout.write("Choose an option : ");
    switch(stdin.readLineSync()!) {
      case '1' : signIn(library: library, customers:customers);
      case '2' : signUp(customers:customers);
      case '3' : admin(customers: customers, library: library);
      case '0' : break while_loop;
      default : print("ERROR : Invalid Input ❌\n");
    }
  }
  print("Byeee ...\n");
}