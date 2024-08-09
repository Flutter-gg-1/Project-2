import 'dart:io';
import 'library.dart';
import 'library_data.dart';
import 'print_with_color.dart';
import 'buy_book.dart';
customer(){
  bool isExit = false;
  do{
  printWithColor(text: "\n          What would you like to do?\n", color: "Magenta");
  printWithColor(text: "(1) List all books", color: "Cyan");
  printWithColor(text: "(2) Buy books", color: "Cyan");
  printWithColor(text: "(3) View receipt", color: "Cyan");
  printWithColor(text: "\n~~~~~~~~~~Please select a number~~~~~~~~~~~~~~\n", color: "Magenta");

  int input = int.parse(stdin.readLineSync()!);

  switch(input){
    case 1:
    Library b1 = Library.fromJson(libraryData);
    print(b1.toJson());
    printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
    stdin.readLineSync();
    break;

    case 2:
    buyBook();
    break;

    default:
      printWithColor(text: "\nPlease select a number", color: "Magenta");

  }
  }while(!isExit);

  
}