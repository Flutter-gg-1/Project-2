import 'dart:io';

user(String usreName) {
  bool isExit = false;
  print("-------------------Welcome $usreName -------------------");
  print("Choose what you want to do:");
  print("1. Buy book");
  print("2. View the purchases receipt");
  print("q. Exit");
  String input = stdin.readLineSync()!;
  do {
    switch (input) {
      case "1":
        break;
      case "2":
        break;

      case "q" || "Q":
        isExit = true;
        break;
      default:
    }
  } while (!isExit);
}
