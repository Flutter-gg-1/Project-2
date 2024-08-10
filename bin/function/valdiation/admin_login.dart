
import 'dart:io';

import '../../model/records.dart';
import '../../utlis/admin_menu.dart';
import '../../utlis/menu.dart';
import '../../utlis/print_with_color.dart';

adminLogin(){
Menu restart = Menu();
PrintWithColor.green('Enter your id');
String id = stdin.readLineSync().toString();

PrintWithColor.green('Enter your password');
String password = stdin.readLineSync().toString();

if (Records.admins[id]==password) {
  return adminMenu();
}
 else if (!Records.admins.containsKey(id)) {
  PrintWithColor.red('⚠️  Admin not found');
  return restart.mainMenu(); 
} else {
  PrintWithColor.red('⚠️  Wrong password');
  return restart.mainMenu(); 
}
}