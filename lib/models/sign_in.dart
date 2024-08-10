import 'dart:io';

import 'package:library_system/models/get_id.dart';
import 'package:library_system/models/menu.dart';
import 'package:library_system/models/user.dart';

void signIn({required List<User> users}) {
  print("Enter 0 to go BACK");
  stdout.write("\nEnter customer ID : ");
  int id = getId(id:stdin.readLineSync(), users:users);
  if(id==0) {
    return;
  }
  menu(mode: 'customer');
  stdout.write("Choose an option : ");
  switch(stdin.readLineSync()) {
    case '1' :
    case '2' :
    case '3' :
    case '4' :
    case '0' :
      print("ERROR : Invalid Input ❌\n");
  }
}