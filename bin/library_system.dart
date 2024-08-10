import 'dart:io';

import 'admin_functions/admin.dart';
import 'user_functions/user.dart';

void main() {
  bool isExit = false;
  do {
    print("---------- welcome to the library systme ------------");
    print("\n ----Enter usrename:");
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
