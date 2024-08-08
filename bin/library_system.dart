import 'dart:io';

import 'admin.dart';
import 'user.dart';

void main() {
  bool isExit = false;
  do {
    print("\n -----------Enter usrename:");
    print("or enter Q for Exit");
    String usreName = stdin.readLineSync()!;
    if (usreName.toLowerCase() == "admin") {
      admin();
    } else if (usreName.toLowerCase() == "q") {
      isExit = true;
    } else {
      user(usreName);
    }
  } while (!isExit);
}
