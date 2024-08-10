import 'dart:io';
import 'print_with_color.dart';

/*
This function for view the receipt for customer's purchases
 */
List<Map<String, dynamic>> localReceipts =[];
viewReceiptCustomer(){
  int count = 1;
  if(localReceipts.isEmpty){
    printWithColor(text: "\nNo receipt available");
  }else{
    /**
     * to view receipt enter customer id, 
     * then customers who match their ID can only access their receipts.
     */
    print("Please enter your ID: ");
    String userId = stdin.readLineSync()!;
    for (var element in localReceipts) {
      if(userId == element["customerID"]){
      print("---- Receipt $count ----");
      count++;
      print("Customer ID: ${element["customerID"]}");
      print("Book title: ${element["title"]}");
      print("Book price: ${element["price"]}");
      print("Book quantity: ${element["quantity"]}");
      print("Time: ${element["time"]}");
      double cost = element['price'] * element['quantity'];
      print("Cost: $cost");
      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      }
    }

    bool isfound = false;
    for (var element in localReceipts) {
      if(userId == element["customerID"]){
        isfound = true;
        break;
      }
    }
    if(!isfound){
      printWithColor(text: "The customer with id $userId not found", color: "Red");
    }
  }
  printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
  stdin.readLineSync();
}