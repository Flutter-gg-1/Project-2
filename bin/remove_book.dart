import 'library_data.dart';
import 'dart:io';
import 'print_with_color.dart';

removeBook(){
  print("Please enter book'd ID: ");
  String id = stdin.readLineSync()!;

  List<dynamic> books = List.from(libraryData['library']);

  for(int i =0; i<books.length; i++){
    if(books[i]['id'] == id){
      books.removeAt(i);
      libraryData['library'] = books;

      printWithColor(text: "\nThe book was successfully removed", color: "Green");
      printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
      stdin.readLineSync();
      return;

    }
  }
  
  printWithColor(text: "The book with ID $id not found", color: "Red");
  
}