import 'signup.dart';
import 'login.dart';
import 'dart:io';
import 'start.dart';
void customerSignIn(){

  print("\n\n\n\n");
  print('Do you have an account?');
  print("\n 1-Yes \n 2-No \n b-Back");
  String? choice = stdin.readLineSync();

  while(choice!='1' && choice!='2' && choice!='b'){
  print("please enter a valid option.");
  choice = stdin.readLineSync();
  }
  if(choice=='1'){
    login();
  }
  else if(choice=='2'){
    customerSignup();
  }
  else{
    start();
  }
}