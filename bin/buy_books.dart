import 'dart:io';
import 'dataset.dart';
import 'models/library_data.dart';
import 'models/library.dart';
import 'project2.dart';
import 'print_receipt.dart';

void buyBooks(String username){
  print("\n\n\n\n");
  print("Hello $username! Here is a list of all available books:");
  print("-----------------------------------");
  LibraryData books = LibraryData.fromJson(libraryData);
  for (Library book in books.library) {
    print("ID: ${book.id}, Title: ${book.title}");
  }
  print("-----------------------------------");
  print("Enter the ID of the book you want to purchase");
  String? bookId = stdin.readLineSync();
  for (Library book in books.library) {
    if(book.id==bookId){ 
      if(book.quantity>0){ //check if book is available
        print("Are you sure you want to buy '${book.title}'?");
        print("\n 1-Yes \n 2-No");
        String? answer = stdin.readLineSync();
        while(answer!="1" && answer!="2"){
          print("Please enter a valid option.");
          answer = stdin.readLineSync();
        }
        if(answer=='1'){
          printReceipt(username, bookId!, book.title, book.price);    
        }
        else{
          break;
        }
      }
      else{
        print("This book, '${book.title}', is out of stock");
        break;
      }
    }
    else{
      print("No such book exist");
    }
  }
  print("Do you want to buy another book?");
  print("\n 1-Yes \n 2-No");
  String? answer = stdin.readLineSync();
  while(answer!="1" && answer!="2"){
    print("Please enter a valid option.");
    answer = stdin.readLineSync();
  }
  if(answer=='1'){
    buyBooks(username);
  }
  else{
    main();
  }
}