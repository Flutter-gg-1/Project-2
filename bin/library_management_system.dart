import 'dart:io';
import 'admin.dart';
import 'customer.dart';

void main(List<String> arguments) {
  bool exit = false;
  print("<<<<<<<<<< Welcome to our library system >>>>>>>>>>");
  do {
    print("Who are you?\n1-Admin\n2-Customer\n0-exit");
    int? input;
    try {
      input = int.parse(stdin.readLineSync()!);
    } catch (ex) {
      print("you should choose by number");
    }

    switch (input) {
      case 1:
        printAdminUi();
        break;
      case 2:
        printCustomerUi();
        break;
      case 0:
        exit = true;
        break;
    }
  } while (!exit);
}
