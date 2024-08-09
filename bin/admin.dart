import 'dart:io';
import 'add_book.dart';
import 'print_with_color.dart';
import 'library.dart';
import 'library_data.dart';
admin(){
  printWithColor(text: "\n          What would you like to do?\n", color: "Magenta");
  printWithColor(text: "(1) Add books", color: "Cyan");
  printWithColor(text: "(2) Remove books", color: "Cyan");
  printWithColor(text: "(3) View receipt", color: "Cyan");
  printWithColor(text: "\n~~~~~~~~~~Please select a number~~~~~~~~~~~~~~\n", color: "Magenta");

  int input = int.parse(stdin.readLineSync()!);

  switch(input){
    case 1:
    addBook(libraryData);
    Library b1 = Library.fromJson(libraryData);
    print(b1.toJson());
    break;

    case 2:
    break;

    case 3:
    break;
    default:
      printWithColor(text: "\nPlease select a number", color: "Magenta");

  }


  
}