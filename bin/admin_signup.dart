
import 'dart:io';

void adminSignIn(){

  print("\n\n\n\n");
  print("Please enter admin password");
  String? password = stdin.readLineSync();
  int passwordEntryCount = 3;

  while(password!='123'){
  print("Wrong password, you have $passwordEntryCount attempts left");

  if(passwordEntryCount==0){
    print("You’ve reached the maximum login attempts.");
    exit(0);
  }
  passwordEntryCount--;
  password = stdin.readLineSync();
  }  
}