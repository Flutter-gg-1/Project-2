import 'dart:io';

import '../../model/records.dart';
import '../../utlis/print_with_color.dart';

addAccount(){
  try {
    PrintWithColor.green('Enter account number : ');
    String accountNumber = stdin.readLineSync().toString();

    PrintWithColor.green('Enter account balance : ');
    double balance = double.parse(stdin.readLineSync().toString());

    Records.cards.addAll({accountNumber : balance});
  } catch (e) {
    PrintWithColor.red('⚠️   Error : $e\nTry again');
  }
}