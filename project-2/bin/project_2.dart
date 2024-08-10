import 'dart:io';

import 'data/dateSet.dart';
import 'functions/adminـfunction.dart';
import 'model/library.dart';
import 'package:ansicolor/ansicolor.dart';
import 'functions/customerـfunction.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yalowPen = AnsiPen()..yellow();
final AnsiPen magentaPen = AnsiPen()..magenta();

void main() {
 // here first page displayed for user
  final library = Library.fromJson(dataLibrary);
  while (true) {
    print(magentaPen("......................................................"));
    print(magentaPen("......................................................"));
    print(greenPen("...........Welcome to the Library System.............."));
    print(magentaPen("......................................................"));
    print(magentaPen("......................................................"));

    print(magentaPen("1.$greenPen Admin"));
    print(magentaPen("2.$greenPen Customer"));
    print(magentaPen("3.$greenPen Exit"));
    stdout.write(magentaPen("$greenPen * Choose: "));
    final choice = stdin.readLineSync();
    if (choice == '1') {
      handleAdmin(library);
    } else if (choice == '2') {
      handleCustomer(library);
    } else if (choice == '3') {
      print(bluePen("Exiting"));
      break;
    } else {
      print(yalowPen("Invalid choice. Please try again."));
    }
  }
}
