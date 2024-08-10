import 'dart:io';
import 'library.dart';
import 'library_data.dart';
import 'print_with_color.dart';
import 'buy_book.dart';
import 'role_based.dart';
import 'view_receipt_customer.dart';
import 'exit_system.dart';
customer(){
  bool isExit = false;
  do{
  printWithColor(text: "\n          What would you like to do?\n", color: "Magenta");
  printWithColor(text: "(1) List all books", color: "Cyan");
  printWithColor(text: "(2) Buy books", color: "Cyan");
  printWithColor(text: "(3) View receipt", color: "Cyan");
  printWithColor(text: "(4) Return back", color: "Cyan");
  printWithColor(text: "(5) Exit System", color: "Cyan");
  printWithColor(text: "\n~~~~~~~~~~Please select a number~~~~~~~~~~~~~~\n", color: "Magenta");

  int? input;
  try {
    input = int.parse(stdin.readLineSync()!);
  } catch (error) {
    printWithColor(text: "A number must be entered.", color: "Red");
    print(error);
    printWithColor(
        text: "\nTo return back to the main features press (Enter)\n",
        color: "Black");
    stdin.readLineSync();
    customer();
  }

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
    case 3:
    viewReceiptCustomer();
    printWithColor(text: "\nTo return back to the main features press (Enter)\n", color: "Black");
    break;
    case 4:
    rolebased();
    break;
    case 5:
    isExit = exitSystem();
    break;
    default:
      printWithColor(text: "\nPlease press (Enter) and select one of number from list", color: "Red");
    stdin.readLineSync();
    customer();

  }
  }while(!isExit);

  
}