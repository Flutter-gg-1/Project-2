import 'dart:io';                                     // library used to interact with user
import 'package:library_system/models/customer.dart'; // customer class
import 'package:library_system/models/book.dart';     // book class
import 'package:library_system/models/display_books.dart';
import 'package:library_system/models/get_id.dart';   // function to validate id
import 'package:library_system/models/menu.dart';     // menu function

// function to perform customer sign in
void signIn({required List<Customer> customers, required List<Book> library}) {
  print("Enter 0 to go BACK");
  stdout.write("\nEnter customer ID : ");
  int id = getId(id: stdin.readLineSync(), customers: customers);
  if (id == 0) {
    return;
  }
  Customer customer = customers.firstWhere((customer) => customer.customerId == id);
  while_loop :
  while (true) {
    menu(mode: 'customer', customer: customer);
    stdout.write("Choose an option : ");
    switch (stdin.readLineSync()) {
      case '1':
        displayBooks(library: library);
      case '2':
        stdout.write("Enter book name : ");
        String bookName = stdin.readLineSync()!;
        try {
          Book book = library.firstWhere((book) => book.title == bookName);
          customer.buyBook(book);
        }
        catch (e) {
          print("ERROR : We have no books with that name ❌\n");
        }
      case '3':
        for(var receipt in customer.receipts) {
          customer.viewReceipt(receipt: receipt);
        }
      case '0': break while_loop;
      default : print("ERROR : Invalid Input ❌\n");
    }
  }
}