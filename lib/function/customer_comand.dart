
import 'dart:io';

import 'package:pro2/models/system_model.dart';

bool customerComand(SystemModel library) {
  int op = 0;

  while (true) {
    print("\n\n");
    print(" &---> Hello to Library System <---& \n");
    print("0: Buy a Book");
    print("-" * 25);
    print("1: Display Receipt");
    print("-" * 25);
    print("2: Log out");
    print("-" * 25);
    print("3: exit");
    print("-" * 25);

    try {
      op = int.parse(stdin.readLineSync()!);

      switch (op) {
        case 0:
          library.buyBook();

          break;

        case 1:
          library.displayReceipt();

          break;

        case 2:
          return false;

        case 3:
          return true;

        default:
          print("######   chose one of the option   ######");
          break;
      }
    } catch (err) {
      print("-" * 25);

      print("######  plase give int number no String or double   ######");

      print("-" * 25);
    }
  }
}
