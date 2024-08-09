import 'dart:io';

import 'print_with_color.dart';
List<Map<String, dynamic>> receipts =[];
viewReceiptAdmin(){

  if(receipts.isEmpty){
    printWithColor(text: "\nNo receipt available");
  }else{
    for (var element in receipts) {
      print("Book title: ${element["title"]}");
      print("Book price: ${element["price"]}");
      print("Book quantity: ${element["quantity"]}");
      double cost = element['price'] * element['quantity'];
      print("cost: $cost}");
      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }
  }
  printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
  stdin.readLineSync();
  }