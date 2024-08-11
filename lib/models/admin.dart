import 'dart:io';                                        // library used to interact with user
import 'package:library_system/models/add_book.dart';    // function to add a book to library
import 'package:library_system/models/display_books.dart';
import 'package:library_system/models/remove_book.dart'; // function to remove a book from library
import 'package:library_system/models/book.dart';        // book class
import 'package:library_system/models/customer.dart';    // customer class
import 'package:library_system/models/menu.dart';        // menu class

void admin({required List<Customer> customers, required List<Book> library}) {
  print("Enter 0 to go BACK");
  while_loop :
  while (true) {
    menu(mode: 'admin');
    stdout.write("Choose an option : ");
    switch (stdin.readLineSync()) {
      case '1': displayBooks(library: library);
      
      case '2': addBook(library: library);
      
      case '3':
        if(library.isEmpty) {
          print("ERROR : No books added to the library yet ❌\n");
        }
        stdout.write("Enter book id : ");
        String? id = stdin.readLineSync();
        while(id==null || library.map((book)=>book.id).toList().contains(id)==false) {
          print("ERROR : Invalid Input ❌\n");
        }
        removeBook(library: library, id: id);
      
      case '4' :
        for(var customer in customers) {
          print(customer.customerId);
          print(customer.name);
          for(var receipt in customer.receipts) {
            customer.viewReceipt(receipt: receipt);
          }
          print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        }
      
      case '0': break while_loop;
      default : print("ERROR : Invalid Input ❌\n");
    }
  }
}