import 'dart:io';
import 'library_data.dart';
import 'print_with_color.dart';

buyBook(){
  print("Please enter book'd ID: ");
  String id = stdin.readLineSync()!;

  List<dynamic> books = List.from(libraryData['library']);

  for(int i =0; i<books.length; i++){
    if(books[i]['id'] == id && books[i]['quantity'] > 0){
      printWithColor(text: "The book was successfully purchased", color:  "Green");
      books[i]['quantity']--;
      printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
      stdin.readLineSync();
      return;
    }
  }

  printWithColor(text: "\nSorry, the book is out of stock", color:  "Red");
  printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
  stdin.readLineSync();

}