import 'package:project_2/helpers/color_print.dart';

import 'management.dart';

void main() {
  printSuccess("Welcome to the library");
  printSuccess("Happy to see you again!");

  Accounts accounts = Accounts();
  accounts.logIn();
}
