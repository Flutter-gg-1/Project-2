import 'dart:io';
import '../model/my_library.dart';
import '../global_variabels.dart';

customerDashboard() {
  do {
    print('''
  |||||||||||||| CUSTOMER ||||||||||||   

  1 | Display Books
  2 | Buy book
  3 | Display my purchase
  4 | Signout
  
  
  ''');

    try {
      int userInput = int.parse(stdin.readLineSync()!);

      switch (userInput) {
        case 1:
          MyLibrary.displayBooks();
          break;
        case 2:
          print("Enter ID of book");
          String userInputID = stdin.readLineSync()!;
          print("Enter the quntity");
          int userInputQnt = int.parse(stdin.readLineSync()!);

          MyLibrary.buyBook(userInputID, userInputQnt, user);
        case 3:
          MyLibrary.displayOneCustomerPurchase();

        default:
          isExitCustomer = true;
          isExitMainPage = false;
      }
    } on FormatException {
      print("Please enter a number");
    } catch (e) {
      print(e);
    }
  } while (!isExitCustomer);
}
