import 'dart:io';
import 'dart:math';
import 'users_data.dart';
void printReceipt(String username, String bookId, String bookTitle, double bookPrice) {
  print("\n\n");
  print("----------------------------------------");
  print("-- Receipt for Library Book Purchase  -- ");
  print("----------------------------------------");
  print(" Book: $bookTitle ");
  print(" Price: $bookPrice ");
  print("----------------------------------------");
  Random random = Random();
  String receiptId =random.nextInt(10000).toString(); 
  //add Receipt
  Map<String,dynamic> receipt ={
    "receiptsId" : receiptId,
    "username" : username,
    "bookTitle" : bookTitle,
    "price" : bookPrice
    };
    receipts.add(receipt);
  stdin.readLineSync();
}