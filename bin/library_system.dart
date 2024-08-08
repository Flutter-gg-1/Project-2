import 'dart:io';

import 'package:library_system/models/menu.dart';

void main(List<String> arguments) {
  print('\nProject 2 : Library System');
  while_loop :
  while(true) {
    menu(mode: 'guest');
    stdout.write("Choose an option : ");
    switch(stdin.readLineSync()!) {
      case '1' :
        // signIn();

      case '2' :
        // signUp();

      case '3' :
        // admin();

      case '0' :
        print("Byeee ...\n");
        break while_loop;
      
      default :
        print("ERROR : Invalid Input ❌\n");
    }
  }
}
