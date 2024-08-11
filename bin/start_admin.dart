  
import 'dart:convert';
import 'dart:io';
import 'start.dart';
import 'book_inisialize.dart';
import 'add_book.dart';
import 'view_receipts.dart';
import 'remove_books.dart';

  startAdmin(){
  print("\n\n\n");
  print("----- Welcome Admin -----");
  print("\n");
  print("Choose an action:");
  print("\n 1-Add a book \n 2-Remove a book \n 3-View all receipts \n b-Back");
  String? choice = stdin.readLineSync();

  while(choice!='1' && choice!='2'  && choice!='3' && choice!='b'){
  print("please enter a valid option.");
  choice = stdin.readLineSync();
  }
  if(choice=='1'){
    addBook(books);
    // Save new book data
    String json = jsonEncode(books.toJson());
    File('library_data.json').writeAsStringSync(json);

    startAdmin();
  }
  else if(choice=='2'){
    removeBook();
  }
  else if(choice=='3'){
    viewReceipts();
  }
  else{
    start();
  }
  }

