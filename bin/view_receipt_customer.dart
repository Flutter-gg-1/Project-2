import 'dart:io';

import 'print_with_color.dart';

List<Map<String, dynamic>> localReceipts =[];
viewReceiptCustomer(){
  int count = 1;
  if(localReceipts.isEmpty){
    printWithColor(text: "\nNo receipt available");
  }else{
    for (var element in localReceipts) {
      print("---- Receipt $count ----");
      count++;
      print("Book title: ${element["title"]}");
      print("Book price: ${element["price"]}");
      print("Book quantity: ${element["quantity"]}");
      print("Time: ${element["time"]}");
      double cost = element['price'] * element['quantity'];
      print("Cost: $cost");
      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }
  }
  printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
  stdin.readLineSync();
}