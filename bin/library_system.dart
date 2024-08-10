import 'dart:io'; // library used to interact with user
import 'package:library_system/dataset.dart'; // dataset
import 'package:library_system/models/menu.dart'; // menu function
import 'package:library_system/models/sign_in.dart'; // sign in function
import 'package:library_system/models/user.dart'; // user class

void main(List<String> arguments) {
  // initialize two important lists
  List<User> users = [];
  List<Map<String,dynamic>> library = dataset['library'];
  print('\nProject 2 : Library System');
  while_loop :
  while(true) {
    menu(mode: 'guest');
    stdout.write("Choose an option : ");
    switch(stdin.readLineSync()!) {
      case '1' :
        signIn(users:users);

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
