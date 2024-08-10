import 'dart:io';

import 'package:library_system/models/library.dart';

welcoming() {
  print("\n\n\n\n");

  print('\x1B[46;1mWelcome to Store Library\x1B[0m');
  print('0: admin');
  print('1: customer');
  print('\x1B[45;1mQ: Exit\x1B[0m');
  stdout.write("\nVisitor input: ");
}

adminPanel() {
  print("\n\n\n\n");
  print("\x1B[46;1m|&--->Admin Mode<---&      |\x1B[0m");
  print('0: add a book');
  print('1: remove a book');
  print('2: print a receipt');
  print('3: display all books');
  print('\x1B[45;1mQ: exit admin mode\x1B[0m');
  stdout.write("\nAdmin input: ");
}

customerPanel() {
  print("\n\n\n\n");
  print("\x1B[46;1m&--->Customer Mode<---&      \x1B[0m");
  print('0: buy book');
  print('1: print a receipt');
  print('2: display books');
  print('\x1B[45;1mQ: exit Customer mode\x1B[0m');
  stdout.write("\nCustomer input: ");
}
