
import 'dart:io';

import '../model/records.dart';
import '../utlis/admin_menu.dart';
import '../utlis/print_with_color.dart';

adminLogin(){
PrintWithColor.green('Enter your id');
String id = stdin.readLineSync().toString();

PrintWithColor.green('Enter your password');
String password = stdin.readLineSync().toString();

if (Records.admins[id]==password) {
  return adminMenu();
}
 else if (!Records.admins.containsKey(id)) {
  PrintWithColor.red('⚠️Admin not found');
} else {
  PrintWithColor.red('⚠️Wrong password');
}
}