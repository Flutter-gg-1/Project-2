import 'dart:io';
import 'library_data.dart';
import 'print_with_color.dart';
import 'view_receipt_admin.dart';
import 'view_receipt_customer.dart';

buyBook(){
  print("Please enter book'd ID: ");
  String id = stdin.readLineSync()!;

  List<dynamic> books = List.from(libraryData['library']);

  for(int i =0; i<books.length; i++){
    if(books[i]['id'] == id && books[i]['quantity'] > 0){
      print("How many copy do you want?: ");
      int copy = int.parse(stdin.readLineSync()!);
      if(copy <= books[i]['quantity']){
      printWithColor(text: "The book was successfully purchased", color:  "Green");
      books[i]['quantity']- copy;
      receipts.add({
        "title": books[i]['title'],
        "price": books[i]['price'],
        "quantity": copy,
        "time": DateTime.now().toString()
      });
      localReceipts.add({
        "title": books[i]['title'],
        "price": books[i]['price'],
        "quantity": copy,
        "time": DateTime.now().toString()
      });
      }else{
        printWithColor(text: "\nThe available quantitiy is ${books[i]['quantity']}\n", color: "Red");
      }
      printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
      stdin.readLineSync();
      return;
    }
  }

  printWithColor(text: "\nSorry, the book is out of stock", color:  "Red");
  printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
  stdin.readLineSync();

}