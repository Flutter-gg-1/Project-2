import 'dart:io';
import 'admin.dart';
import 'customer.dart';
import 'exit_method.dart';

void main() {

  //variable
  bool isExit = false;
  //loop of opreation
  do {
    print("\n\n\n\n\n");
    print(" _____________________________________________________ ");
    print("|                                                     |");
    print("|              Welcome to Library System              |");
    print("|                                                     |");
    print("|_____________________________________________________|");
    print("\n\n* Select user type:");
    print("0: Admin");
    print("1: Customer");
    print("Q: Exit");

    print("Enter your choice:");
    String? userInput = stdin.readLineSync();
    //error handling
    try {
      if (userInput!.isEmpty) {
        throw FormatException("X Empty input X");
      }

      switch (userInput) {
        //go to admin function
        case "0":
          admin();
          break;

        //go to customer function
        case "1":
          customer();
          break;

        //for exit
        case "Q" || "q":
          isExit = exitMethod();
          break;

        default:
          print("X Invalid choice please select choice from the list X");
      }
    } catch (e) {
      print("X Error: $e X");
    }

    //end loop
  } while (!isExit);
  print("See you later (:");
}
